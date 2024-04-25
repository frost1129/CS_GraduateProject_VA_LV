package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopicRequest {
    private Long id;
    private String intentCode;
    private String description;
    private Long categoryId;
    private String note;
}
