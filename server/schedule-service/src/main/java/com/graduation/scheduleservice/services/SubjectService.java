package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.SubjectDTO;
import com.graduation.scheduleservice.dtos.SubjectSaveDTO;
import com.graduation.scheduleservice.dtos.SubjectSearchResponse;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface SubjectService {
    SubjectSearchResponse getListSubject(Map<String, String> params);
    List<SubjectDTO> getAllSubject();
    SubjectDTO getSubjectById(Long id);
    SubjectDTO getSubjectByCode(String code);
    SubjectDTO addOrUpdateSubject(Long id, SubjectSaveDTO saveDTO);
    List<SubjectDTO> importSubjects(MultipartFile file);
    void deleteSubject(Long id);
}
