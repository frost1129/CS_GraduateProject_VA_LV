package com.graduation.productservice.service;

import com.graduation.productservice.dtos.ProductRequest;
import com.graduation.productservice.dtos.ProductResponse;
import com.graduation.productservice.models.Product;
import com.graduation.productservice.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public ProductResponse save(ProductRequest productRequest) {
        Product product = Product.builder()
                .name(productRequest.getName())
                .price(productRequest.getPrice())
                .build();

        return mapToProductResponse(productRepository.save(product));
    }

    private ProductResponse mapToProductResponse(Product product) {
        return ProductResponse.builder()
                .name(product.getName())
                .price(product.getPrice())
                .build();
    }

    public List<ProductResponse> findAll() {
        return productRepository.findAll().stream().map(this::mapToProductResponse).collect(Collectors.toList());
    }
}
