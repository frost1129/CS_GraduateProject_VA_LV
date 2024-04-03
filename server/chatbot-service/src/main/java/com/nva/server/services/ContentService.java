package com.nva.server.services;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;

import java.util.List;

public interface ContentService {
    List<ContentResponse> findAll();
    ContentResponse addOrUpdate(Long contentId, ContentRequest contentRequest);
}
