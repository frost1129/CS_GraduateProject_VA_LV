package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentRequest {
    private Long parentContentId;
//    private Short contentLevel;
    private Long schoolYearId;
    private Long categoryId;
    private Long topicId;
    private String title;
    private String text;
    private String note;
}
