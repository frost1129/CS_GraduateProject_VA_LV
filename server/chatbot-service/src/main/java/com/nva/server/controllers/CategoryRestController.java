package com.nva.server.controllers;

import com.nva.server.dtos.CategoryResponse;
import com.nva.server.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/chat-bot-service/categories")
@RequiredArgsConstructor
@CrossOrigin
public class CategoryRestController {
    private final CategoryService categoryService;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<CategoryResponse>> getCategories(@RequestParam(required = false) Map<String, String> params) {
        return ResponseEntity.ok(categoryService.getCategories(params));
    }
}
