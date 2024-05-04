package com.nva.server.services.impl;

import com.nva.server.constants.CustomPageSize;
import com.nva.server.dtos.AnswerResponse;
import com.nva.server.dtos.ConversationHistoryResponse;
import com.nva.server.dtos.ConversationHistoryResponseV2;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.ConversationHistory;
import com.nva.server.repositories.ConversationHistoryRepository;
import com.nva.server.services.ConversationHistoryService;
import com.nva.server.services.DialogflowService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class ConversationHistoryResponseImpl implements ConversationHistoryService {
    private final ConversationHistoryRepository conversationHistoryRepository;
    private final EntityManager entityManager;
    private final JwtDecoder jwtDecoder;
    private final Environment env;
    private final DialogflowService dialogflowService;

    @Override
    public ConversationHistoryResponseV2 getConversationHistories(Map<String, String> params) {
        ConversationHistoryResponseV2 responseV2 = new ConversationHistoryResponseV2();

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<ConversationHistory> query = criteriaBuilder.createQuery(ConversationHistory.class);
        Root<ConversationHistory> root = query.from(ConversationHistory.class);

        Predicate predicate = criteriaBuilder.conjunction();

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (page <= 0) page = 1;
        responseV2.setCurrentPage(page);
        responseV2.setPageSize(CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);

        if (params.containsKey("username") && !params.get("username").isEmpty()) {
            String username = params.get("username");
            predicate = criteriaBuilder.or(criteriaBuilder.like(root.get("username"), "%" + username + "%")
            );
        }

        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        // Pagination calculation
        TypedQuery<ConversationHistory> typedQuery = entityManager.createQuery(query);

        long totalDataSize = typedQuery.getResultList().size();

        typedQuery.setFirstResult((page - 1) * CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);
        typedQuery.setMaxResults(CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);

        // Fetching results
        responseV2.setData(typedQuery.getResultList().stream().map(this::mapToConversationHistoryResponse).toList());


        int totalPages = (int) Math.ceil((double) totalDataSize / CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);
        responseV2.setTotalPages(totalPages);

        return responseV2;
    }

    @Override
    public ConversationHistoryResponseV2 getSelfConversationHistories(Map<String, String> params) {
        ConversationHistoryResponseV2 responseV2 = new ConversationHistoryResponseV2();

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<ConversationHistory> query = criteriaBuilder.createQuery(ConversationHistory.class);
        Root<ConversationHistory> root = query.from(ConversationHistory.class);

        criteriaBuilder.conjunction();
        Predicate predicate;

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (page <= 0) page = 1;
        responseV2.setCurrentPage(page);
        responseV2.setPageSize(CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);

        predicate = criteriaBuilder.or(criteriaBuilder.like(root.get("username"), "%" + getUsernameFromToken(params.getOrDefault("username", "")) + "%"));


        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.asc(root.get("createdDate")));

        // Calculate total data size
        TypedQuery<ConversationHistory> countQuery = entityManager.createQuery(query);
        int totalDataSize = countQuery.getResultList().size();

        // Calculate start index for reverse pagination
        long startIndex = totalDataSize - ((long) page * CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);
        if (startIndex < 0) startIndex = 0; // Handle the case when the start index goes negative

        // Pagination calculation
        TypedQuery<ConversationHistory> typedQuery = entityManager.createQuery(query);
        typedQuery.setFirstResult((int) startIndex);
        typedQuery.setMaxResults(CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);

        // Fetching results
        responseV2.setData(typedQuery.getResultList().stream().map(this::mapToConversationHistoryResponse).toList());


        int totalPages = (int) Math.ceil((double) totalDataSize / CustomPageSize.CONVERSATION_HISTORY_PAGE_SIZE);
        responseV2.setTotalPages(totalPages);

        return responseV2;
    }

    @Override
    public ConversationHistoryResponse addConversationHistory(String questionText, String accessToken) {
        try {
            ConversationHistory conversationHistory = new ConversationHistory();
            conversationHistory.setUsername(getUsernameFromToken(accessToken));
            conversationHistory.setQuestion(questionText);

            AnswerResponse answerResponse = dialogflowService.answerUserQuestion(env.getProperty("dialogflow.project-name"),
                    getUsernameFromToken(accessToken),
                    questionText);

            conversationHistory.setAnswer(
                    answerResponse.getAnswer());
            conversationHistory.setImageLink(answerResponse.getImageLink());
            conversationHistory.setCreatedDate(System.currentTimeMillis());

            return mapToConversationHistoryResponse(conversationHistoryRepository.save(conversationHistory));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public void deleteConversationHistory(Long conversationHistoryId) {
        try {
            conversationHistoryRepository.deleteById(conversationHistoryId);
        } catch (Exception e) {
            throw new SaveDataException("Xóa lịch sử trò chuyện thất bại!");
        }
    }

    private ConversationHistoryResponse mapToConversationHistoryResponse(ConversationHistory conversationHistory) {
        ConversationHistoryResponse response = new ConversationHistoryResponse();
        response.setId(conversationHistory.getId());
        response.setUsername(conversationHistory.getUsername());
        response.setQuestion(conversationHistory.getQuestion());
        response.setAnswer(conversationHistory.getAnswer());
        response.setImageLink(conversationHistory.getImageLink());
        response.setCreatedDate(conversationHistory.getCreatedDate());
        response.setLastModifiedDate(conversationHistory.getLastModifiedDate());

        return response;
    }

    public String getUsernameFromToken(String accessToken) {
        Jwt jwt = jwtDecoder.decode(accessToken); // Decode the token to a Jwt object
        return jwt.getClaim("preferred_username");
    }
}
