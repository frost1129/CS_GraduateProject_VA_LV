package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConversationHistoryResponse {
    private Long id;
    private String username;
    private String question;
    private String answer;
    private String imageLink;
    private Long createdDate;
    private Long lastModifiedDate;
}
