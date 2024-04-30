package com.nva.server.services.impl;

import com.nva.server.constants.CustomPageSize;
import com.nva.server.dtos.SchoolYearRequest;
import com.nva.server.dtos.SchoolYearResponse;
import com.nva.server.dtos.SchoolYearResponseV3;
import com.nva.server.exceptions.EntityNotFound;
import com.nva.server.exceptions.SaveDataException;
import com.nva.server.models.SchoolYear;
import com.nva.server.repositories.SchoolYearRepository;
import com.nva.server.services.SchoolYearService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SchoolYearServiceImpl implements SchoolYearService {
    private final SchoolYearRepository schoolYearRepository;
    private final EntityManager entityManager;

    @Override
    public SchoolYearResponseV3 getSchoolYears(Map<String, String> params) {
        SchoolYearResponseV3 responseV3 = new SchoolYearResponseV3();

        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<SchoolYear> query = criteriaBuilder.createQuery(SchoolYear.class);
        Root<SchoolYear> root = query.from(SchoolYear.class);

        Predicate predicate = criteriaBuilder.conjunction();

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (page <= 0) page = 1;
        responseV3.setCurrentPage(page);
        responseV3.setPageSize(CustomPageSize.SCHOOL_YEAR_PAGE_SIZE);

        if (params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            predicate = criteriaBuilder.or(
                    criteriaBuilder.like(root.get("courseName"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("year"), "%" + keyword + "%"),
                    criteriaBuilder.like(root.get("note"), "%" + keyword + "%")
            );
        }

        query.select(root).where(predicate);
        query.orderBy(criteriaBuilder.desc(root.get("createdDate")));

        // Pagination calculation
        TypedQuery<SchoolYear> typedQuery = entityManager.createQuery(query);

        long totalDataSize = typedQuery.getResultList().size();

        typedQuery.setFirstResult((page - 1) * CustomPageSize.SCHOOL_YEAR_PAGE_SIZE);
        typedQuery.setMaxResults(CustomPageSize.SCHOOL_YEAR_PAGE_SIZE);

        // Fetching results
        responseV3.setData(typedQuery.getResultList().stream().map(this::mapToSchoolYearResponse).collect(Collectors.toList()));


        int totalPages = (int) Math.ceil((double) totalDataSize / CustomPageSize.SCHOOL_YEAR_PAGE_SIZE);
        responseV3.setTotalPages(totalPages);

        return responseV3;
    }

    @Override
    @Transactional
    public SchoolYearResponse addOrUpdateSchoolYear(SchoolYearRequest schoolYearRequest) {
        //  CASE: Add new topic | ELSE: Update existing topic
        if (schoolYearRequest.getId() == null) {
            try {
                if (schoolYearRepository.findByYear(schoolYearRequest.getYear()).isPresent())
                    throw new SaveDataException("Năm học đã tồn tại!");

                SchoolYear schoolYear = new SchoolYear();
                schoolYear.setCourseName(schoolYearRequest.getCourseName());
                schoolYear.setYear(schoolYearRequest.getYear());
                schoolYear.setNote(schoolYearRequest.getNote());
                schoolYear.setCreatedDate(System.currentTimeMillis());

                return mapToSchoolYearResponse(schoolYearRepository.save(schoolYear));
            } catch (SaveDataException e) {
                throw new SaveDataException(e.getMessage());
            } catch (Exception e) {
                throw new SaveDataException("Tạo năm học thất bại!");
            }
        } else {
            Optional<SchoolYear> existingSchoolYear = schoolYearRepository.findById(schoolYearRequest.getId());
            if (existingSchoolYear.isPresent()) {
                try {
                    Optional<SchoolYear> existingAttributeYearEntity = schoolYearRepository.findByYear(schoolYearRequest.getYear());
                    if (existingAttributeYearEntity.isEmpty() || Objects.equals(existingAttributeYearEntity.get().getId(), existingSchoolYear.get().getId())) {
                        existingSchoolYear.get().setYear(schoolYearRequest.getYear());
                        existingSchoolYear.get().setCourseName(schoolYearRequest.getCourseName());
                        existingSchoolYear.get().setNote(schoolYearRequest.getNote());
                        existingSchoolYear.get().setLastModifiedDate(System.currentTimeMillis());

                        return mapToSchoolYearResponse(schoolYearRepository.save(existingSchoolYear.get()));
                    } else throw new SaveDataException("Năm học đã tồn tại!");
                } catch (SaveDataException e) {
                    throw new SaveDataException(e.getMessage());
                } catch (Exception e) {
                    throw new SaveDataException("Cập nhật năm học thất bại!");
                }
            } else throw new EntityNotFound("Không tìm thấy năm học!");
        }
    }

    @Override
    @Transactional
    public void deleteSchoolYear(Long schoolYearId) {
        schoolYearRepository.deleteById(schoolYearId);
    }

    private SchoolYearResponse mapToSchoolYearResponse(SchoolYear schoolYear) {
        SchoolYearResponse response = new SchoolYearResponse();
        response.setId(schoolYear.getId());
        response.setCourseName(schoolYear.getCourseName());
        response.setYear(schoolYear.getYear());
        response.setCreatedDate(schoolYear.getCreatedDate());
        response.setLastModifiedDate(schoolYear.getLastModifiedDate());
        response.setNote(schoolYear.getNote());

        return response;
    }

    private boolean canUpdateSchoolYear(SchoolYearRequest schoolYearRequest) {
        Optional<SchoolYear> existingSchoolYear = schoolYearRepository.findById(schoolYearRequest.getId());

        if (existingSchoolYear.isPresent()) {
            Optional<SchoolYear> existingAttributeYearEntity = schoolYearRepository.findByYear(schoolYearRequest.getYear());
            if (existingAttributeYearEntity.isPresent()) {
                return Objects.equals(existingAttributeYearEntity.get().getId(), existingSchoolYear.get().getId());
            }
        }
        return false;
    }
}
