package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopicResponse {
    private Long id;
    private String intentCode;
    private String description;
    private CategoryResponseV2 category;
    private Long createdDate;
    private Long lastModifiedDate;
    private String note;
}
