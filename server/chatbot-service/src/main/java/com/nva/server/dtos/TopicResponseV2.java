package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TopicResponseV2 {
    private Long id;
    private String intentCode;
    private String description;
    private CategoryResponseV2 category;
    private String note;
}
