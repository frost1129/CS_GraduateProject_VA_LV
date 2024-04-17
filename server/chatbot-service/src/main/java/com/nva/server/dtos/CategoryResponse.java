package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryResponse {
    private Long id;
    private String intentCode;
    private String description;
    private Long createdDate;
    private Long lastModifiedDate;
    private String note;
}
