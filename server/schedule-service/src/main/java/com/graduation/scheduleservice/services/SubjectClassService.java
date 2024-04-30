package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSaveDTO;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

public interface SubjectClassService {
    SubjectClassDTO getClassById(Long id);
    List<SubjectClassDTO> getAllClassByYearCode(int yearCode);
    List<SubjectClassDTO> getAllClassByYearCodeOfStudent(int yearCode, Long studentId);
    List<SubjectClassDTO> getAllClassByYearCodeOfTeacher(int yearCode, Long teacherId);
    List<SubjectClassDTO> getAllClassByYearCodeAndSubject(int yearCode, Long subjectId);
    SubjectClassDTO addSubjectClass(SubjectClassSaveDTO saveDTO);
    List<SubjectClassDTO> importSubjectClasses(MultipartFile file, int yearCode);
    SubjectClassDTO updateSubjectClass(Long classId, SubjectClassSaveDTO saveDTO);
    void deleteSubjectClass(Long id);
}
