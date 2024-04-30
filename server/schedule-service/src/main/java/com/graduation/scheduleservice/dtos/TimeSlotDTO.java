package com.graduation.scheduleservice.dtos;

import lombok.Data;

import java.time.LocalTime;

@Data
public class TimeSlotDTO {
    private Long id;
    private LocalTime startHour;
    private LocalTime endHour;
    private Long createdDate;
    private Long updatedDate;
}
