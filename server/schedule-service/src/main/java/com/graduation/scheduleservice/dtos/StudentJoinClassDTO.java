package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class StudentJoinClassDTO {
    private Long id;
    private String studentId;
    private Float totalScore;
    private SubjectClassDTO subjectClass;
    private Long createdDate;
    private Long updatedDate;
}
