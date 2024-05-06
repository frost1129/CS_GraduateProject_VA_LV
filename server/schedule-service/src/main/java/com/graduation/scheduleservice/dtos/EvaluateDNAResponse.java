package com.graduation.scheduleservice.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EvaluateDNAResponse {
    private int overlapStudent;
    private int overSchedule;
    private int overallScore;
}
