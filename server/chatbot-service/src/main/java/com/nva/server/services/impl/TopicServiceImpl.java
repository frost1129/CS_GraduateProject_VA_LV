package com.nva.server.services.impl;

import com.nva.server.dtos.CategoryResponseV2;
import com.nva.server.dtos.TopicRequest;
import com.nva.server.dtos.TopicResponse;
import com.nva.server.exceptions.EntityNotFound;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Category;
import com.nva.server.models.Topic;
import com.nva.server.repositories.CategoryRepository;
import com.nva.server.repositories.TopicRepository;
import com.nva.server.services.TopicService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TopicServiceImpl implements TopicService {
    private final TopicRepository topicRepository;
    private final CategoryRepository categoryRepository;
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
    @Transactional
    public TopicResponse addOrUpdateTopic(TopicRequest topicRequest) {
        //  CASE: Add new topic | ELSE: Update existing topic
        if (topicRequest.getId() == null) {
            try {
                if (topicRepository.findByIntentCode(topicRequest.getIntentCode()).isPresent())
                    throw new SaveDataException("Chủ đề đã tồn tại!");

                Topic topic = new Topic();
                topic.setIntentCode(topicRequest.getIntentCode());
                topic.setDescription(topicRequest.getDescription());
                topic.setNote(topicRequest.getNote());
                topic.setCreatedDate(System.currentTimeMillis());

                topic.setCategory(categoryRepository.findById(topicRequest.getCategoryId()).get());

                return mapToTopicResponse(topicRepository.save(topic));
            } catch (SaveDataException e) {
                throw new SaveDataException(e.getMessage());
            } catch (Exception e) {
                throw new SaveDataException("Tạo chủ đề thất bại!");
            }
        } else {
            Optional<Topic> existingTopic = topicRepository.findById(topicRequest.getId());
            if (existingTopic.isPresent()) {
                try {
                    existingTopic.get().setDescription(topicRequest.getDescription());
                    existingTopic.get().setNote(topicRequest.getNote());
                    existingTopic.get().setLastModifiedDate(System.currentTimeMillis());

                    return mapToTopicResponse(topicRepository.save(existingTopic.get()));
                } catch (Exception e) {
                    throw new SaveDataException("Cập nhật chủ đề thất bại!");
                }
            } else throw new EntityNotFound("Không tìm thấy chủ đề!");
        }
    }

    @Override
    public void deleteTopic(Long topicId) {
        try {
            topicRepository.deleteById(topicId);
        } catch (Exception e) {
            throw new SaveDataException("Xóa chủ đề thất bại!");
        }
    }

    private TopicResponse mapToTopicResponse(Topic topic) {
        TopicResponse topicResponse = new TopicResponse();
        topicResponse.setId(topic.getId());
        topicResponse.setIntentCode(topic.getIntentCode());
        topicResponse.setDescription(topic.getDescription());
        topicResponse.setCreatedDate(topic.getCreatedDate());
        topicResponse.setLastModifiedDate(topic.getLastModifiedDate());
        topicResponse.setNote(topic.getNote());

        topicResponse.setCategory(CategoryResponseV2.builder()
                .id(topic.getCategory().getId())
                .intentCode(topic.getCategory().getIntentCode())
                .description(topic.getCategory().getDescription())
                .build());

        return topicResponse;
    }
}
