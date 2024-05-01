package com.graduation.scheduleservice.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDate;

@Data
@AllArgsConstructor
public class SCScheduleDTO {
    private LocalDate startDate;
    private int weeks;
    private int weekday;
    private int startTimeSlot;
    private int endTimeSlot;
    private String teacherId;
    private Long createdDate;
    private Long updatedDate;
}
