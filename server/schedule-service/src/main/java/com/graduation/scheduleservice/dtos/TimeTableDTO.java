package com.graduation.scheduleservice.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalTime;

@Data
@AllArgsConstructor
public class TimeTableDTO {
    private String subjectCode;
    private String subjectName;
    private LocalDate startDate;
    private int weeks;
    private int weekday;
    private LocalTime startTime;
    private LocalTime endTime;
}
