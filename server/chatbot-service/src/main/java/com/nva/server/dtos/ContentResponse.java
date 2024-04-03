package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentResponse {
    private Long parentContentId;
    private Integer contentLevel;
    private SchoolYearResponseV2 schoolYear;
    private TopicResponseV2 topic;
    private String title;
    private String text;
    private String note;
    private Long createdDate;
    private Long lastModifiedDate;
}

