package com.nva.server.services;

import com.nva.server.dtos.*;

import java.util.Map;

public interface ConversationHistoryService {
    ConversationHistoryResponseV2 getConversationHistories(Map<String, String> params);
    ConversationHistoryResponseV2 getSelfConversationHistories(Map<String, String> params, String accessToken);
    ConversationHistoryResponse addConversationHistory(ConversationHistoryRequest conversationHistoryRequest);
    void deleteConversationHistory(Long deleteConversationHistory);
}
