package com.nva.server.services;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;

import java.util.List;
import java.util.Map;

public interface ContentService {
    List<ContentResponse> getContents(Map<String, String> params);
    ContentResponse addOrUpdateContent(ContentRequest contentRequest);
    void deleteContent(Long contentId);
}
