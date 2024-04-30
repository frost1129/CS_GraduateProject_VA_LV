package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class TimeSlotSaveDTO {
    private Long id;
    private String startTime;
    private String endTime;
}
