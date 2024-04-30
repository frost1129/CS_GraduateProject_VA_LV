package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.SchoolYear;
import lombok.Data;

@Data
public class YearCodeDTO {
    private Long id;
    private int yearCode;
    private int semester;
    private SchoolYear schoolYear;
    private Long createdDate;
}
