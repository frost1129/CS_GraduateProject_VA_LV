package com.graduation.scheduleservice.dtos;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ScheduleRequest {
    private int yearCode;
    private LocalDate date;
    private int length;
    private int size;
    private Float mutationRate;
}
