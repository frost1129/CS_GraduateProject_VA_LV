package com.graduation.scheduleservice.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;

@Data
public class ScheduleRequest {
    private int yearCode;
    @JsonFormat(pattern="dd-MM-yyyy")
    private LocalDate date;
    private int length;
    private int size;
    private Float mutationRate;
    private int minFitness;
}
