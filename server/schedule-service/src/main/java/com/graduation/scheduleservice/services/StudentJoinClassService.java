package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.StudentJoinClassDTO;
import com.graduation.scheduleservice.dtos.StudentJoinClassSaveDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface StudentJoinClassService {
    StudentJoinClassDTO getById(Long id);
    List<Long> getAllStudentIdBySubjectClassId(Long subjectId);
    List<StudentJoinClassDTO> getAllByYearCodeAndStudentId(int yearCode, Long studentId);
    List<StudentJoinClassDTO> getAllByYearCodeAndSubjectClassId(int yearCode, Long subjectId);
    StudentJoinClassDTO addStudentJoinClass(StudentJoinClassSaveDTO saveDTO);
    List<StudentJoinClassDTO> importStudentJoinClassDataByYearCode(MultipartFile file);
    StudentJoinClassDTO updateStudentJoinClass(Long id, StudentJoinClassSaveDTO saveDTO);
    void deleteStudentJoinClass(Long id);
}
