package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchoolYearResponse {
    private Long id;
    private String year;
    private String courseName;
    private Long createdDate;
    private Long lastModifiedDate;
    private String note;
}
