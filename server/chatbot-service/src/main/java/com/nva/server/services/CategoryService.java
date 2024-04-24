package com.nva.server.services;

import com.nva.server.dtos.CategoryRequest;
import com.nva.server.dtos.CategoryResponse;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    List<CategoryResponse> getCategories(Map<String, String> params);
    CategoryResponse addOrUpdateCategory(CategoryRequest categoryRequest);
    boolean deleteCategory(Long categoryId);
}
