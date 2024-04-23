package com.nva.server.services;

import com.nva.server.dtos.CategoryResponse;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    List<CategoryResponse> getCategories(Map<String, String> params);
}
