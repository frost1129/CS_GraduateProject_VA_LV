package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.YearCode;
import lombok.Data;

@Data
public class SubjectClassShortDTO {
    private Long id;
    private String subject;
    private YearCode yearCode;
    private SCScheduleDTO subjectClassSchedule;
    private int numberOfStudents;
    private Long createdDate;
    private Long updatedDate;
    private String note;
}
