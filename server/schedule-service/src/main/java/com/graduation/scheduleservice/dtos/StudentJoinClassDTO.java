package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.SubjectClass;
import lombok.Data;

@Data
public class StudentJoinClassDTO {
    private Long id;
    private String studentId;
    private Float totalScore;
    private SubjectClass subjectClass;
    private Long createdDate;
    private Long updatedDate;
}
