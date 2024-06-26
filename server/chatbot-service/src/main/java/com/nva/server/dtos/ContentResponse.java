package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentResponse {
    private Long id;
    private String uuid;
    private ContentResponseV2 parentContent;
    private Integer contentLevel;
    private SchoolYearResponseV2 schoolYear;
    private TopicResponseV2 topic;
    private String intentCode;
    private String title;
    private String text;
    private String imageLink;
    private String note;
    private Long createdDate;
    private Long lastModifiedDate;
}

