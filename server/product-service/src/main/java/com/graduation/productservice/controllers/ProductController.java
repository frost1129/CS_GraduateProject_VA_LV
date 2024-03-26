package com.graduation.productservice.controllers;

import com.graduation.productservice.dtos.ProductRequest;
import com.graduation.productservice.dtos.ProductResponse;
import com.graduation.productservice.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping
    @PreAuthorize("hasAnyRole('admin', 'user')")
    public ResponseEntity<List<ProductResponse>> getProducts() {
        return ResponseEntity.status(HttpStatus.OK).body(productService.findAll());
    }

    @PostMapping
    @PreAuthorize("hasRole('admin')")
    public ResponseEntity<ProductResponse> saveProduct(@RequestBody ProductRequest productRequest) {
        return ResponseEntity.status(HttpStatus.CREATED).body(productService.save(productRequest));
    }
}
