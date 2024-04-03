package com.nva.server.services.impl;

import com.nva.server.dtos.*;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Content;
import com.nva.server.repositories.ContentRepository;
import com.nva.server.repositories.SchoolYearRepository;
import com.nva.server.repositories.TopicRepository;
import com.nva.server.services.ContentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class ContentServiceImpl implements ContentService {
    private final ContentRepository contentRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final TopicRepository topicRepository;

    @Override
    public ContentResponse save(ContentRequest contentRequest) {
        try {
            return mapToContentResponse(contentRepository.save(mapToContent(contentRequest)));
        } catch (Exception e) {
            throw new SaveDataException("Lưu thất bại");
        }
    }

    private Content mapToContent(ContentRequest contentRequest) {
        Content content = new Content();
        content.setSchoolYear(schoolYearRepository.findById(contentRequest.getSchoolYearId()).get());
        content.setTopic(topicRepository.findById(contentRequest.getTopicId()).get());
        content.setNote(contentRequest.getNote());
        content.setTitle(contentRequest.getTitle());
        content.setText(contentRequest.getText());

        if (contentRequest.getParentContentId() != null) {
            Optional<Content> parentContent = contentRepository.findById(contentRequest.getParentContentId());
            if (parentContent.isPresent()) {
                content.setParentContent(parentContent.get());
                content.setContentLevel(parentContent.get().getContentLevel() + 1);
            } else
                content.setParentContent(null);
        } else
            content.setContentLevel(1);

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
