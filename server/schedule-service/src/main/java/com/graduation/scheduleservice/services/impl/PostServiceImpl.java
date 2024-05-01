package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.constants.PagingSize;
import com.graduation.scheduleservice.dtos.PostResponse;
import com.graduation.scheduleservice.dtos.SubjectSearchResponse;
import com.graduation.scheduleservice.models.Post;
import com.graduation.scheduleservice.models.Subject;
import com.graduation.scheduleservice.repositories.PostRepository;
import com.graduation.scheduleservice.services.PostService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final EntityManager entityManager;


    @Override
    public Post getPostByID(Long id) {
        return postRepository.findById(id).orElseThrow();
    }

    @Override
    public PostResponse getListPost(Map<String, String> params) {
        PostResponse response = new PostResponse();

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Post> query = criteriaBuilder.createQuery(Post.class);
        Root<Post> root = query.from(Post.class);

        Predicate predicate = criteriaBuilder.conjunction();

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (page <= 0) page = 1;
        response.setCurrentPage(page);
        response.setPageSize(PagingSize.GENERAL_PAGESIZE);

        if (params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            predicate = criteriaBuilder.or(
                    criteriaBuilder.like(root.get("title"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("content"), "%" + keyword + "%")
            );
        }

        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        // Pagination calculation
        TypedQuery<Post> typedQuery = entityManager.createQuery(query);
        long totalDataSize = typedQuery.getResultList().size();
        typedQuery.setFirstResult((page - 1) * PagingSize.GENERAL_PAGESIZE);
        typedQuery.setMaxResults(PagingSize.GENERAL_PAGESIZE);

        // Fetching results
        response.setData(typedQuery.getResultList());
        int totalPages = (int) Math.ceil((double) totalDataSize / PagingSize.GENERAL_PAGESIZE);
        response.setTotalPages(totalPages);

        return response;
    }
}
