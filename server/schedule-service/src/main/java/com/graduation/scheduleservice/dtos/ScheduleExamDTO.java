package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.TimeSlot;
import lombok.Data;

import java.time.LocalDate;

@Data
public class ScheduleExamDTO {
    private SubjectClassDTO subjectClass;
    private LocalDate examDate;
    private int lengthInMinute;
    private TimeSlot timeSlot;
}
