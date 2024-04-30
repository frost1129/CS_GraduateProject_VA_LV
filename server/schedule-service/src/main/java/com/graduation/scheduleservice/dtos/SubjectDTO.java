package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class SubjectDTO {
    private Long id;
    private String subjectCode;
    private String subjectName;
    private float credits;
    private Long createdDate;
    private Long updatedDate;
    private String note;
}
