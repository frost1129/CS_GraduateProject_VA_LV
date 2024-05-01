package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.SubjectClass;
import lombok.Data;

@Data
public class StudentJoinClassSaveDTO {
    private String studentId;
    private Float totalScore;
    private SubjectClass subjectClass;
}
