package com.nva.server.services;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;
import com.nva.server.dtos.ContentResponseV3;
import com.nva.server.models.Content;

import java.util.List;
import java.util.Map;

public interface ContentService {
    List<ContentResponse> getContents(Map<String, String> params);
    ContentResponseV3 getContentsV2(Map<String, String> params);
    ContentResponse addOrUpdateContent(ContentRequest contentRequest);
    void deleteContent(Long contentId);
    Content getContentByIntents(Map<String, String> params);
}
