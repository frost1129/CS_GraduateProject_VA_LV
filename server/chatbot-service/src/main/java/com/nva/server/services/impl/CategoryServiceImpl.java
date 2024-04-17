package com.nva.server.services.impl;

import com.nva.server.dtos.CategoryResponse;
import com.nva.server.models.Category;
import com.nva.server.repositories.CategoryRepository;
import com.nva.server.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<CategoryResponse> findAll() {
        return categoryRepository.findAll().stream().map(this::mapToCategoryResponse).collect(Collectors.toList());
    }

    private CategoryResponse mapToCategoryResponse(Category category) {
        CategoryResponse categoryResponse = new CategoryResponse();
        categoryResponse.setId(category.getId());
        categoryResponse.setIntentCode(category.getIntentCode());
        categoryResponse.setDescription(category.getDescription());
        categoryResponse.setCreatedDate(category.getCreatedDate());
        categoryResponse.setLastModifiedDate(category.getLastModifiedDate());
        categoryResponse.setNote(category.getNote());
        return categoryResponse;
    }
}
