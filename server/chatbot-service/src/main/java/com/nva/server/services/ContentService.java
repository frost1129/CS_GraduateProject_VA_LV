package com.nva.server.services;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;

public interface ContentService {
    ContentResponse save(ContentRequest contentRequest);
}
