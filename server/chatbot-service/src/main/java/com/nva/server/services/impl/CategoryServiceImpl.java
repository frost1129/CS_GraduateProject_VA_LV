package com.nva.server.services.impl;

import com.nva.server.dtos.CategoryResponseV2;
import com.nva.server.repositories.CategoryRepository;
import com.nva.server.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<CategoryResponseV2> findAll() {
        return null;
    }
}
