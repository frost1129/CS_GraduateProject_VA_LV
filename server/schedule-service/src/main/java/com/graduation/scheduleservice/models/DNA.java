package com.graduation.scheduleservice.models;

import com.graduation.scheduleservice.dtos.EvaluateDNAResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DNA {
    private HashMap<Long, ScheduledExam> examSchedules;
    private int fitness;
    private Float prob;
    private LocalDate startDate;
    private int totalDays;
    private int totalClass;
    private EvaluateDNAResponse evaluate;

    private Random random = new Random();

    //    new random DNA
    public DNA(LocalDate startD, int totalDays, List<TimeSlot> slots, List<SubjectClass> scheduleList) {
        this.startDate = startD;
        this.totalDays = totalDays;
        this.totalClass = scheduleList.size();
        this.fitness = -1;
        this.examSchedules = new HashMap<Long, ScheduledExam>();

        ScheduledExam exam;

        for (SubjectClass subjectClass : scheduleList) {
            exam = new ScheduledExam();
            exam.setSubjectClass(subjectClass);
            exam.setTimeSlot(slots.get(random.nextInt(slots.size() - 1 + 1)));
            exam.setExamDate(startDate.plusDays(ThreadLocalRandom.current().nextLong(totalDays)));
//            exam.setRoom();

            this.examSchedules.put(subjectClass.getId(), exam);
        }
    }

    //    cross-over DNA
    public DNA(DNA p1, DNA p2, List<SubjectClass> scheduleList) {
        this.startDate = p1.startDate;
        this.totalDays = p1.getTotalDays();
        this.totalClass = p1.getTotalClass();
        this.fitness = -1;
        this.examSchedules = new HashMap<Long, ScheduledExam>();

        int crossOverPoint = random.nextInt(this.totalClass);

        for (int i = 0; i < crossOverPoint; i++) {
            Long nextScheduleId = scheduleList.get(i).getId();
            ScheduledExam nextSchedule = p1.examSchedules.get(nextScheduleId);
            this.examSchedules.put(nextScheduleId, nextSchedule);
        }

        for (int i = crossOverPoint; i < this.totalClass; i++) {
            Long nextScheduleId = scheduleList.get(i).getId();
            ScheduledExam nextSchedule = p2.examSchedules.get(nextScheduleId);
            this.examSchedules.put(nextScheduleId, nextSchedule);
        }
    }

    public void mutate(Float mutationRate, List<TimeSlot> slots, List<SubjectClass> scheduleList) {
        int mutateProb = (int) (mutationRate * 100);

        if (mutateProb == 0)
            return;

        for (SubjectClass subjectClass : scheduleList) {
            if (random.nextInt(100) + 1 > mutateProb) {
                continue;
            }

            LocalDate randomDate = this.startDate.plusDays(ThreadLocalRandom.current().nextLong(this.totalDays));
            TimeSlot randomTimeSlot = slots.get(random.nextInt(slots.size() - 1 + 1));

            this.examSchedules.get(subjectClass.getId()).setTimeSlot(randomTimeSlot);
            this.examSchedules.get(subjectClass.getId()).setExamDate(randomDate);
//            this.examSchedules.get(subjectClass.getId()).setRoom();
        }
    }
}