package com.nva.server.services.impl;

import com.nva.server.dtos.*;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Content;
import com.nva.server.repositories.ContentRepository;
import com.nva.server.repositories.SchoolYearRepository;
import com.nva.server.repositories.TopicRepository;
import com.nva.server.services.ContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class ContentServiceImpl implements ContentService {
    private final ContentRepository contentRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final TopicRepository topicRepository;

    @Override
    public List<ContentResponse> findAll() {
        return contentRepository.findAll().stream().map(this::mapToContentResponse).collect(Collectors.toList());
    }

    @Override
    public ContentResponse addOrUpdate(Long contentId, ContentRequest contentRequest) {
        try {

            // CASE: Save new content
            if (contentId == null)
                return mapToContentResponse(contentRepository.save(mapToContent(contentRequest)));

            // CASE: Update existing content
            Optional<Content> existingContent = contentRepository.findById(contentId);
            if (existingContent.isPresent()) {
                // TODO: Handle update attributes of current content
                existingContent.get().setTitle(contentRequest.getTitle());
                existingContent.get().setText(contentRequest.getText());
                existingContent.get().setNote(contentRequest.getNote());
                existingContent.get().setLastModifiedDate(System.currentTimeMillis());

                // CASE: Content is super parent
                if (existingContent.get().getParentContent() == null) {
                    existingContent.get().setTopic(topicRepository.findById(contentRequest.getTopicId()).get());

                    // TODO: Handle update topic of children content of current content
                    List<Content> childContents = existingContent.get().getChildContents();
                    childContents.forEach(content -> content.setTopic(topicRepository.findById(existingContent.get().getTopic().getId()).get()));
                }

                return mapToContentResponse(existingContent.get());
            }
            throw new SaveDataException("ID không tồn tại");
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    private Content mapToContent(ContentRequest contentRequest) throws Exception {
        Content content = new Content();
        content.setSchoolYear(schoolYearRepository.findById(contentRequest.getSchoolYearId()).get());
        content.setNote(contentRequest.getNote());
        content.setTitle(contentRequest.getTitle());
        content.setText(contentRequest.getText());

        if (contentRequest.getParentContentId() != null) {
            Optional<Content> parentContent = contentRepository.findById(contentRequest.getParentContentId());
            if (parentContent.isPresent()) {
                content.setParentContent(parentContent.get());
                content.setContentLevel(parentContent.get().getContentLevel() + 1);
                content.setTopic(parentContent.get().getTopic());
            } else throw new Exception();
        } else {
            content.setContentLevel(1);
            content.setTopic(topicRepository.findById(contentRequest.getTopicId()).get());
        }

        return content;
    }

    private ContentResponse mapToContentResponse(Content content) {
        ContentResponse contentResponse = new ContentResponse();
        contentResponse.setId(content.getId());
        contentResponse.setContentLevel(content.getContentLevel());
        contentResponse.setSchoolYear(SchoolYearResponseV2.builder()
                .id(content.getSchoolYear().getId())
                .year(content.getSchoolYear().getYear())
                .courseName(content.getSchoolYear().getCourseName())
                .build());
        contentResponse.setTopic(TopicResponseV2.builder()
                .id(content.getTopic().getId())
                .name(content.getTopic().getName())
                .category(CategoryResponseV2.builder()
                        .id(content.getTopic().getCategory().getId())
                        .name(content.getTopic().getCategory().getName())
                        .build())
                .build());
        contentResponse.setTitle(content.getTitle());
        contentResponse.setText(content.getText());
        contentResponse.setNote(content.getNote());
        contentResponse.setCreatedDate(content.getCreatedDate());
        contentResponse.setLastModifiedDate(content.getLastModifiedDate());

        if (content.getParentContent() != null)
            contentResponse.setParentContentId(content.getParentContent().getId());
        else
            contentResponse.setParentContentId(null);

        return contentResponse;
    }
}
