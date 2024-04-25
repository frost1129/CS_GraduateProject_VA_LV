package com.nva.server.services.impl;

import com.nva.server.dtos.CategoryResponseV2;
import com.nva.server.dtos.TopicRequest;
import com.nva.server.dtos.TopicResponse;
import com.nva.server.models.Category;
import com.nva.server.models.Topic;
import com.nva.server.repositories.TopicRepository;
import com.nva.server.services.TopicService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TopicServiceImpl implements TopicService {
    private final TopicRepository topicRepository;
    private final EntityManager entityManager;

    @Override
    public List<TopicResponse> getTopics(Map<String, String> params) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Topic> query = criteriaBuilder.createQuery(Topic.class);
        Root<Topic> root = query.from(Topic.class);

        Predicate predicate = criteriaBuilder.conjunction();

        if (params != null && params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            predicate = criteriaBuilder.or(
                    criteriaBuilder.like(root.get("intentCode"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("description"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("note"), "%" + keyword + "%")
            );
        }
        if (params != null && params.containsKey("categoryId") && !params.get("categoryId").isEmpty()) {
            long categoryId = Long.parseLong(params.get("categoryId"));
            Join<Topic, Category> categoryJoin = root.join("category");
            predicate = criteriaBuilder.and(predicate, criteriaBuilder.equal(categoryJoin.get("id"), categoryId));
        }

        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        return entityManager.createQuery(query).getResultList().stream().map(this::mapToTopicResponse).collect(Collectors.toList());
    }

    @Override
    public TopicResponse addOrUpdateTopic(TopicRequest topicRequest) {
        return null;
    }

    @Override
    public void deleteTopic(Long topicId) {

    }

    private TopicResponse mapToTopicResponse(Topic topic) {
        TopicResponse topicResponse = new TopicResponse();
        topicResponse.setId(topic.getId());
        topicResponse.setIntentCode(topic.getIntentCode());
        topicResponse.setDescription(topic.getDescription());
        topicResponse.setCreatedDate(topic.getCreatedDate());
        topic.setLastModifiedDate(topic.getLastModifiedDate());
        topicResponse.setNote(topic.getNote());

        topicResponse.setCategory(CategoryResponseV2.builder()
                .id(topic.getCategory().getId())
                .intentCode(topic.getCategory().getIntentCode())
                .description(topic.getCategory().getDescription())
                .build());

        return topicResponse;
    }
}
