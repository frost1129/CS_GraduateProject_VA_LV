package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.ScheduledExam;
import com.graduation.scheduleservice.models.Subject;
import com.graduation.scheduleservice.models.SubjectClassSchedule;
import com.graduation.scheduleservice.models.YearCode;
import lombok.Data;

@Data
public class SubjectClassDTO {
    private Long id;
    private Subject subject;
    private YearCode yearCode;
    private ScheduledExam scheduledExam;
    private SubjectClassSchedule subjectClassSchedule;
    private Long createdDate;
    private Long updatedDate;
    private String note;
}
