package com.graduation.scheduleservice.services.impl;

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
import java.util.List;
import java.util.Random;
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


    @Override
    public void initAlgorithm(int yearCode, LocalDate startDay, int totalDay, int populationSize) {
        this.schedules = classService.getAllClassByYearCode(yearCode)
                .stream().map(this::mapToSubjectClass)
                .collect(Collectors.toList());
        this.timeslots = masterService.getAllTimeSlot()
                .stream().map(this::mapToTimeSlot)
                .collect(Collectors.toList());
        this.population = new ArrayList<>(populationSize);

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
        if (dna.getFitness() != 0)
            return dna.getFitness();

        int point = 0;

        for (int i = 0; i < this.schedules.size() - 1; i++) {
            ScheduledExam exam1 = dna.getExamSchedules().get(this.schedules.get(i).getId());

            for (int j = i + 1; j < this.schedules.size(); j++) {
                ScheduledExam exam2 = dna.getExamSchedules().get(this.schedules.get(j).getId());

//                Check sv có 2 môn thi cùng 1 ngày
                if (exam1.getExamDate().equals(exam2.getExamDate())) {
//                    Check sv nào thi 2 môn cùng lúc
                    if (exam1.getTimeSlot().equals(exam2.getTimeSlot())) {
                        for (Long std1Id : this.joinClassService.getAllStudentIdBySubjectClassId(exam1.getSubjectClass().getId())) {
                            if (this.joinClassService.getAllStudentIdBySubjectClassId(exam2.getSubjectClass().getId()).contains(std1Id))
                                point += FitnessPenalty.FIRST_CLASS.getPenaltyValue();
                        }
                    }
//                    Check sv nào thi 2 môn liên tiếp
                    else if (exam1.getTimeSlot().isRightAfter(exam2.getTimeSlot()))
                        point += FitnessPenalty.SECOND_CLASS.getPenaltyValue();
                }
            }
        }

        dna.setFitness(point);
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
    public DNA doMutation(DNA dna, Float mulRate) {
        dna.mutate(mulRate, timeslots, schedules);
        return dna;
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
        rs.setScheduledExam(dto.getScheduledExam());
        rs.setNote(dto.getNote());
        return rs;
    }
}
