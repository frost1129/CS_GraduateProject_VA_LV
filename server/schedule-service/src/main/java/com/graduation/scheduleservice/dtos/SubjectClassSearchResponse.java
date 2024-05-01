package com.graduation.scheduleservice.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubjectClassSearchResponse {
    private List<SubjectClassShortDTO> data;
    private int currentPage;
    private int pageSize;
    private int totalPages;
}
