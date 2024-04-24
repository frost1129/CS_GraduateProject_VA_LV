package com.nva.server.services.impl;

import com.nva.server.dtos.CategoryRequest;
import com.nva.server.dtos.CategoryResponse;
import com.nva.server.exceptions.EntityNotFound;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.Category;
import com.nva.server.repositories.CategoryRepository;
import com.nva.server.services.CategoryService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;
    private final EntityManager entityManager;

    @Override
    public List<CategoryResponse> getCategories(Map<String, String> params) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Category> query = criteriaBuilder.createQuery(Category.class);
        Root<Category> root = query.from(Category.class);

        Predicate predicate = criteriaBuilder.conjunction();

        if (params != null && params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            predicate = criteriaBuilder.or(
                    criteriaBuilder.like(root.get("intentCode"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("description"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("note"), "%" + keyword + "%")
            );
        }
        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        return entityManager.createQuery(query).getResultList().stream().map(this::mapToCategoryResponse).collect(Collectors.toList());
    }

    @Override
    public CategoryResponse addOrUpdateCategory(CategoryRequest categoryRequest) {
        //  CASE: Add new category | ELSE: Update existing category
        if (categoryRequest.getId() == null) {
            try {
                if (categoryRepository.findByIntentCode(categoryRequest.getIntentCode()).isPresent())
                    throw new SaveDataException("Danh mục đã tồn tại!");

                Category category = new Category();
                category.setIntentCode(categoryRequest.getIntentCode());
                category.setDescription(categoryRequest.getDescription());
                category.setNote(categoryRequest.getNote());
                category.setCreatedDate(System.currentTimeMillis());

                return mapToCategoryResponse(categoryRepository.save(category));
            } catch (SaveDataException e) {
                throw new SaveDataException(e.getMessage());
            } catch (Exception e) {
                throw new SaveDataException("Tạo danh mục thất bại!");
            }
        } else {
            Optional<Category> existingCategory = categoryRepository.findById(categoryRequest.getId());
            if (existingCategory.isPresent()) {
                try {
                    existingCategory.get().setDescription(categoryRequest.getDescription());
                    existingCategory.get().setNote(categoryRequest.getNote());
                    existingCategory.get().setLastModifiedDate(System.currentTimeMillis());

                    return mapToCategoryResponse(categoryRepository.save(existingCategory.get()));
                } catch (Exception e) {
                    throw new SaveDataException("Cập nhật danh mục thất bại!");
                }
            } else throw new EntityNotFound("Không tìm thấy danh mục!");
        }
    }

    @Override
    public boolean deleteCategory(Long categoryId) {
        try {
            categoryRepository.deleteById(categoryId);
            return true;
        } catch (Exception e) {
            throw new SaveDataException("Xóa danh mục thất bại!");
        }
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
