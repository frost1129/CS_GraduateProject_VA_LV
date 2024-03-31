package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentResponse {
    private Long parentContentId;
    private Short contentLevel;
    private SchoolYearOfContentResponse schoolYear;
    private CategoryOfContentResponse category;
    private TopicOfContentResponse topic;
    private String title;
    private String text;
    private String note;
    private Long createdDate;
    private Long lastModifiedDate;
}

