package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.ScheduledExam;
import com.graduation.scheduleservice.models.Subject;
import com.graduation.scheduleservice.models.SubjectClassSchedule;
import com.graduation.scheduleservice.models.YearCode;
import lombok.Data;

@Data
public class SubjectClassSaveDTO {
    private Subject subject;
    private YearCode yearCode;
    private ScheduledExam scheduledExam;
    private SubjectClassSchedule subjectClassSchedule;
    private String note;
}
