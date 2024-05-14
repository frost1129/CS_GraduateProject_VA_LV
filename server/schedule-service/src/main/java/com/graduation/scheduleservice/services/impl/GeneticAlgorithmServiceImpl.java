package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.constants.FitnessPenalty;
import com.graduation.scheduleservice.dtos.EvaluateDNAResponse;
import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.TimeSlotDTO;
import com.graduation.scheduleservice.models.*;
import com.graduation.scheduleservice.services.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class GeneticAlgorithmServiceImpl implements GeneticAlgorithmService {

    private final MasterSettingService masterService;
    private final SubjectClassService classService;
    private final StudentJoinClassService joinClassService;

    @Getter
    private List<DNA> population;
    private int totalFitness;
    private List<TimeSlot> timeslots;
    private List<SubjectClass> schedules;
    private Map<Long, List<String>> studentIdCache;


    @Override
    public void initAlgorithm(int yearCode, LocalDate startDay, int totalDay, int populationSize) {
        this.schedules = classService.getAllClassByYearCode(yearCode)
                .stream().map(this::mapToSubjectClass)
                .collect(Collectors.toList());
        this.timeslots = masterService.getAllTimeSlot()
                .stream().map(this::mapToTimeSlot)
                .collect(Collectors.toList());
        this.population = new ArrayList<>(populationSize);
        this.studentIdCache = new HashMap<>();
        for (SubjectClass subjectClass : this.schedules) {
            this.studentIdCache.put(subjectClass.getId(), joinClassService.getAllStudentIdBySubjectClassId(subjectClass.getId()));
        }

        for (int i = 0; i < populationSize; i++) {
            DNA newDNA = new DNA(startDay, totalDay, timeslots, schedules);
            this.population.add(newDNA);
        }

        this.evaluatePopulation();
    }

    @Override
    public DNA getBestResult() {
        return this.population.get(0);
    }

    @Override
    public DNA getWorstResult() {
        return this.population.get(population.size() - 1);
    }

    @Override
    public void evaluatePopulation() {
        this.totalFitness = 0;
        for (DNA dna : this.population) {
            this.totalFitness += this.calcFitness(dna);
        }

        this.sortByFitness();
    }

    @Override
    public void sortByFitness() {
        population.sort(DNAComparator.obj);
    }

    @Override
    public void sortByDayAndTime() {
        // TODO
    }

    @Override
    public int calcFitness(DNA dna) {
        if (dna.getFitness() != -1)
            return dna.getFitness();

        int point = 0;
        int overlap = 0;
        int overSchedule = 0;

        Map<LocalDate, Set<TimeSlot>> dateToTimeSlots = new HashMap<>();
        for (ScheduledExam exam : dna.getExamSchedules().values()) {
            dateToTimeSlots.computeIfAbsent(exam.getExamDate(), k -> new HashSet<>()).add(exam.getTimeSlot());
        }

        for (Map.Entry<LocalDate, Set<TimeSlot>> entry : dateToTimeSlots.entrySet()) {
            LocalDate date = entry.getKey();
            Set<TimeSlot> timeSlots = entry.getValue();

            if (timeSlots.size() > 1) {
                // Check for same-day conflicts
                for (TimeSlot timeSlot1 : timeSlots) {
                    for (TimeSlot timeSlot2 : timeSlots) {
                        if (timeSlot1 != timeSlot2) {
                            boolean overlapFlg = false;
                            boolean consecutive = timeSlot1.isRightAfter(timeSlot2);

                            for (ScheduledExam exam1 : dna.getExamSchedules().values()) {
                                if (exam1.getExamDate().equals(date) && exam1.getTimeSlot().equals(timeSlot1)) {
                                    for (ScheduledExam exam2 : dna.getExamSchedules().values()) {
                                        if (exam2.getExamDate().equals(date) && exam2.getTimeSlot().equals(timeSlot2)) {
                                            List<String> studentIds1 = studentIdCache.get(exam1.getSubjectClass().getId());
                                            List<String> studentIds2 = studentIdCache.get(exam2.getSubjectClass().getId());
                                            for (String studentId : studentIds1) {
                                                if (studentIds2.contains(studentId)) {
                                                    overlapFlg = true;
                                                    break; // No need to check further if overlap found
                                                }
                                            }
                                            if (overlapFlg) break; // No need to check further if overlap found
                                        }
                                    }
                                }
                                if (overlapFlg) break; // No need to check further if overlap found
                            }

                            if (overlapFlg) {
                                point += FitnessPenalty.FIRST_CLASS;
                                overlap++;
                            } else if (consecutive) {
                                point += FitnessPenalty.SECOND_CLASS;
                                overSchedule++;
                            }
                        }
                    }
                }
            }
        }

        EvaluateDNAResponse evaluation = new EvaluateDNAResponse(overlap, overSchedule, point);
        dna.setFitness(point);
        dna.setEvaluate(evaluation);
        return point;
    }

    @Override
    public void calcProb(int worstFitness) {
        for (DNA dna : this.population) {
            dna.setProb((float) (1.0 - ((float) dna.getFitness())/worstFitness));
        }
    }

    @Override
    public DNA randomParent() {
        int worstFitness = this.getWorstResult().getFitness();
        this.calcProb(worstFitness);

        int i = 0;
        Random random = new Random();
        double r = random.nextDouble();

        while (r > 0) {
            r = r - this.population.get(i).getProb();
            if (r > 0) i++;

            if (i == this.population.size())
                return this.population.get(0);
        }

        return this.population.get(i);
    }

    @Override
    public void doCrossOver(Float mulRate) {
        int initSize = this.population.size();
        int keepSize = initSize / 2;

        this.population.subList(keepSize, this.population.size()).clear();

        while (this.population.size() < initSize) {
            DNA p1 = randomParent();
            DNA p2 = randomParent();

            DNA child = new DNA(p1, p2, schedules);
            this.doMutation(child, mulRate);
            this.population.add(child);
        }

        this.evaluatePopulation();
    }

    @Override
    public void doMutation(DNA dna, Float mulRate) {
        dna.mutate(mulRate, timeslots, schedules);
    }

    private TimeSlot mapToTimeSlot(TimeSlotDTO dto) {
        TimeSlot rs = new TimeSlot();
        rs.setId(dto.getId());
        rs.setStartHour(dto.getStartHour());
        rs.setEndHour(dto.getEndHour());
        return rs;
    }

    private SubjectClass mapToSubjectClass(SubjectClassDTO dto) {
        SubjectClass rs = new SubjectClass();
        rs.setId(dto.getId());
        rs.setSubject(dto.getSubject());
        rs.setSubjectClassSchedule(dto.getSubjectClassSchedule());
        rs.setYearCode(dto.getYearCode());
        rs.setNote(dto.getNote());
        return rs;
    }
}
