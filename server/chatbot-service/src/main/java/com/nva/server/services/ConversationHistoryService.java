package com.nva.server.services;

import com.nva.server.dtos.ConversationHistoryResponse;
import com.nva.server.dtos.ConversationHistoryResponseV2;

import java.util.Map;

public interface ConversationHistoryService {
    ConversationHistoryResponseV2 getConversationHistories(Map<String, String> params);
    ConversationHistoryResponseV2 getSelfConversationHistories(Map<String, String> params);
    ConversationHistoryResponse addConversationHistory(String questionText, String accessToken);
    void deleteConversationHistory(Long deleteConversationHistory);
}
