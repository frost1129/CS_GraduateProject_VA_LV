package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ContentResponseV2 {
    private Long id;
    private Integer contentLevel;
    private String intentCode;
    private String title;
    private String text;
    private String note;
}
