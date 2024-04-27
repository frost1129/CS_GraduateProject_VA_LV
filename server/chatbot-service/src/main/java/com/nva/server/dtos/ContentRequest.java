package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentRequest {
    private Long id;
    private Long parentContentId;
    private Long schoolYearId;
    private Long topicId;
    private String intentCode;
    private String title;
    private String text;
    private String imageBase64;
    private String note;
}
