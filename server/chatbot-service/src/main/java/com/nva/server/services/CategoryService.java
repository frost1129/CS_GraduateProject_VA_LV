package com.nva.server.services;

import com.nva.server.dtos.CategoryResponseV2;

import java.util.List;

public interface CategoryService {
    List<CategoryResponseV2> findAll();
}
