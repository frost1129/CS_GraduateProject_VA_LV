package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class SchoolYearDTO {
    private Long id;
    private int year;
    private Long createdDate;
    private Long updatedDate;
    private String note;
}
