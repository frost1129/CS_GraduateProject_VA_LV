package com.nva.server.services;

import com.nva.server.dtos.CategoryResponse;

import java.util.List;

public interface CategoryService {
    List<CategoryResponse> findAll();
}
