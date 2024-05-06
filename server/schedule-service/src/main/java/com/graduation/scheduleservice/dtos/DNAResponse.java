package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.ScheduledExam;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DNAResponse {
    private List<ScheduledExam> examList;
    private EvaluateDNAResponse evaluate;
    private LocalDate startDate;
    private int totalDays;
    private int totalClass;
}
