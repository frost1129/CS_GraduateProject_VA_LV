package com.nva.server.services.impl;

import com.cloudinary.Cloudinary;
import com.nva.server.dtos.*;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Content;
import com.nva.server.models.SchoolYear;
import com.nva.server.models.Topic;
import com.nva.server.repositories.ContentRepository;
import com.nva.server.repositories.SchoolYearRepository;
import com.nva.server.repositories.TopicRepository;
import com.nva.server.services.ContentService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ContentServiceImpl implements ContentService {
    private final ContentRepository contentRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final TopicRepository topicRepository;
    private final EntityManager entityManager;
    private final Cloudinary cloudinary;

    @Override
    @Transactional
    public ContentResponse addOrUpdateContent(ContentRequest contentRequest) {

        // CASE: Save new content
        if (contentRequest.getId() == null) {
            try {
                if (contentRepository.findByIntentCode(contentRequest.getIntentCode()).isPresent())
                    throw new SaveDataException("Nội dung đã tồn tại!");
                else {
                    Content content = new Content();
                    content.setUuid(UUID.randomUUID().toString());
                    content.setSchoolYear(schoolYearRepository.findById(contentRequest.getSchoolYearId()).get());
                    content.setNote(contentRequest.getNote());
                    content.setTitle(contentRequest.getTitle());
                    content.setText(contentRequest.getText());

                    // CASE: If image base64 string is not null
                    if (contentRequest.getImageBase64() != null && !contentRequest.getImageBase64().isEmpty()) {
                        try {
                            String publicId = "ou_graduation_" + content.getUuid();
                            Map<String, Object> params = new HashMap<>();
                            params.put("resource_type", "image");
                            params.put("folder", "ou_graduation_project");
                            params.put("public_id", publicId);

                            Map<?, ?> uploadResult = this.cloudinary.uploader().upload(contentRequest.getImageBase64(), params);
                            // Extract the secure URL of the uploaded image
                            content.setImageLink(uploadResult.get("secure_url").toString());

                            if (!uploadResult.isEmpty())
                                this.cloudinary.uploader().destroy(publicId, null);

                        } catch (Exception e) {
                            throw new SaveDataException("Tạo mới nội dung thất bại!");
                        }
                    }

                    // CASE: Is child content
                    if (contentRequest.getParentContentId() != null) {
                        Optional<Content> parentContent = contentRepository.findById(contentRequest.getParentContentId());
                        if (parentContent.isPresent()) {
                            content.setParentContent(parentContent.get());
                            content.setContentLevel(parentContent.get().getContentLevel() + 1);
                            content.setTopic(parentContent.get().getTopic());

                            if (contentRequest.getIntentCode() == null)
                                throw new Exception();
                            content.setIntentCode(parentContent.get().getIntentCode() + "." + contentRequest.getIntentCode());
                        } else throw new SaveDataException("Nội dung gốc không tồn tại!");

                    } else {
                        // CASE: Is parent content
                        content.setContentLevel(1);
                        content.setTopic(topicRepository.findById(contentRequest.getTopicId()).get());
                        content.setIntentCode(contentRequest.getIntentCode());
                    }

                    return mapToContentResponse(contentRepository.save(content));
                }
            } catch (SaveDataException e) {
                throw new SaveDataException(e.getMessage());
            } catch (Exception e) {
                throw new SaveDataException("Tạo mới nội dung thất bại!");
            }
        } else {
            // CASE: Update existing content
            Optional<Content> existingContent = contentRepository.findById(contentRequest.getId());
            if (existingContent.isPresent()) {
                try {
                    // TODO: Handle update attributes of current content
                    existingContent.get().setTitle(contentRequest.getTitle());
                    existingContent.get().setText(contentRequest.getText());
                    existingContent.get().setNote(contentRequest.getNote());
                    existingContent.get().setLastModifiedDate(System.currentTimeMillis());

                    // CASE: If image base64 string is not null
                    if (contentRequest.getImageBase64() != null && !contentRequest.getImageBase64().isEmpty()) {
                        try {
                            String publicId = "ou_graduation_" + existingContent.get().getUuid();
                            Map<String, Object> params = new HashMap<>();
                            params.put("resource_type", "image");
                            params.put("folder", "ou_graduation_project");
                            params.put("public_id", publicId);

                            Map<?, ?> uploadResult = this.cloudinary.uploader().upload(contentRequest.getImageBase64(), params);
                            // Extract the secure URL of the uploaded image
                            existingContent.get().setImageLink(uploadResult.get("secure_url").toString());

                            if (!uploadResult.isEmpty())
                                this.cloudinary.uploader().destroy(publicId, null);

                        } catch (Exception e) {
                            throw new SaveDataException("Chỉnh sửa nội dung thất bại!");
                        }
                    }

                    // CASE: Content is super parent
                    if (existingContent.get().getParentContent() == null) {
                        existingContent.get().setTopic(topicRepository.findById(contentRequest.getTopicId()).get());

                        // TODO: Handle update topic of children content of current content
                        List<Content> childContents = existingContent.get().getChildContents();
                        childContents.forEach(content -> content.setTopic(topicRepository.findById(existingContent.get().getTopic().getId()).get()));
                    }

                    return mapToContentResponse(existingContent.get());
                } catch (Exception e) {
                    throw new SaveDataException("Cập nhật nội dung thất bại!");
                }
            } else throw new SaveDataException("Nội dung không tồn tại");
        }
    }

    @Override
    public List<ContentResponse> getContents(Map<String, String> params) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Content> query = criteriaBuilder.createQuery(Content.class);
        Root<Content> root = query.from(Content.class);

        Predicate predicate = criteriaBuilder.conjunction();

        if (params != null && params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            predicate = criteriaBuilder.or(
                    criteriaBuilder.like(root.get("intentCode"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("title"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("text"), "%" + keyword + "%")
            );
        }

        if (params != null && params.containsKey("topicId") && !params.get("topicId").isEmpty()) {
            long topicId = Long.parseLong(params.get("topicId"));
            Join<Content, Topic> topicJoin = root.join("topic");
            predicate = criteriaBuilder.and(predicate, criteriaBuilder.equal(topicJoin.get("id"), topicId));
        }

        if (params != null && params.containsKey("sYear") && !params.get("sYear").isEmpty()) {
            String sYear = params.get("sYear");
            Join<Content, SchoolYear> schoolYearJoin = root.join("schoolYear");
            predicate = criteriaBuilder.and(predicate, criteriaBuilder.equal(schoolYearJoin.get("year"), sYear));
        }

        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        return entityManager.createQuery(query).getResultList().stream().map(this::mapToContentResponse).collect(Collectors.toList());
    }

    @Override
    public void deleteContent(Long contentId) {
        try {
            contentRepository.deleteById(contentId);
        } catch (Exception e) {
            throw new SaveDataException("Xóa nội dung thất bại!");
        }
    }

    private ContentResponse mapToContentResponse(Content content) {
        ContentResponse contentResponse = new ContentResponse();
        contentResponse.setUuid(content.getUuid());
        contentResponse.setId(content.getId());
        contentResponse.setContentLevel(content.getContentLevel());
        contentResponse.setSchoolYear(SchoolYearResponseV2.builder()
                .id(content.getSchoolYear().getId())
                .year(content.getSchoolYear().getYear())
                .courseName(content.getSchoolYear().getCourseName())
                .build());
        contentResponse.setTopic(TopicResponseV2.builder()
                .id(content.getTopic().getId())
                .intentCode(content.getTopic().getIntentCode())
                .description(content.getTopic().getDescription())
                .category(CategoryResponseV2.builder()
                        .id(content.getTopic().getCategory().getId())
                        .intentCode(content.getTopic().getCategory().getIntentCode())
                        .description(content.getTopic().getCategory().getDescription())
                        .build())
                .build());
        contentResponse.setIntentCode(content.getIntentCode());
        contentResponse.setTitle(content.getTitle());
        contentResponse.setText(content.getText());
        contentResponse.setNote(content.getNote());
        contentResponse.setCreatedDate(content.getCreatedDate());
        contentResponse.setLastModifiedDate(content.getLastModifiedDate());

        if (content.getParentContent() != null) {
            contentResponse.setParentContent(ContentResponseV2.builder()
                    .id(content.getParentContent().getId())
                    .contentLevel(content.getParentContent().getContentLevel())
                    .intentCode(content.getParentContent().getIntentCode())
                    .title(content.getParentContent().getTitle())
                    .text(content.getParentContent().getText())
                    .note(content.getParentContent().getNote()).build());
        } else
            contentResponse.setParentContent(null);

        return contentResponse;
    }
}
