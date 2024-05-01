package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSaveDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSearchResponse;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface SubjectClassService {
    SubjectClassSearchResponse getListSubjectClass(Map<String, String> params);
    SubjectClassDTO getClassById(Long id);
    List<SubjectClassDTO> getAllClassByYearCode(int yearCode);
    List<SubjectClassDTO> getAllClassByYearCodeOfStudent(int yearCode, String studentId);
    List<SubjectClassDTO> getAllClassByYearCodeOfTeacher(int yearCode, String teacherId);
    List<SubjectClassDTO> getAllClassByYearCodeAndSubject(int yearCode, Long subjectId);
    SubjectClassDTO addSubjectClass(SubjectClassSaveDTO saveDTO);
    List<SubjectClassDTO> importSubjectClasses(MultipartFile file, int yearCode);
    SubjectClassDTO updateSubjectClass(Long classId, SubjectClassSaveDTO saveDTO);
    void deleteSubjectClass(Long id);
}
