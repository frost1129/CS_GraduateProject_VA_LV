package com.nva.server.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConversationHistoryResponseV2 {
    private List<ConversationHistoryResponse> data;
    private int currentPage;
    private int pageSize;
    private int totalPages;
}
