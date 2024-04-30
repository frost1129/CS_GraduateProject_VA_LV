package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class SubjectSaveDTO {
    private String subjectCode;
    private String subjectName;
    private float credits;
    private String note;
}
