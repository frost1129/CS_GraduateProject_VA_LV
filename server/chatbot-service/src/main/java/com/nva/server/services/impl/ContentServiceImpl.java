package com.nva.server.services.impl;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;
import com.nva.server.dtos.SchoolYearResponseV2;
import com.nva.server.dtos.TopicResponseV2;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Content;
import com.nva.server.repositories.CategoryRepository;
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
@Slf4j
@Transactional
public class ContentServiceImpl implements ContentService {
    private final ContentRepository contentRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final CategoryRepository categoryRepository;
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
        contentResponse.setContentLevel(content.getContentLevel());
        contentResponse.setSchoolYear(SchoolYearResponseV2.builder()
                .year(content.getSchoolYear().getYear())
                .courseName(content.getSchoolYear().getCourseName())
                .build());
        contentResponse.setTopic(TopicResponseV2.builder()
                .name(content.getTopic().getName())
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
