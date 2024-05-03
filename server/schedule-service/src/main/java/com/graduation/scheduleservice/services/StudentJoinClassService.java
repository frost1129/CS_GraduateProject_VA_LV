package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.StudentJoinClassDTO;
import com.graduation.scheduleservice.dtos.StudentJoinClassSaveDTO;
import com.graduation.scheduleservice.dtos.TimeTableDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface StudentJoinClassService {
    StudentJoinClassDTO getById(Long id);
    List<String> getAllStudentIdBySubjectClassId(Long subjectId);
    List<StudentJoinClassDTO> getAllByYearCodeAndStudentId(int yearCode, String studentId);
    List<StudentJoinClassDTO> getAllByYearCodeAndSubjectClassId(int yearCode, Long subjectId);
    StudentJoinClassDTO addStudentJoinClass(StudentJoinClassSaveDTO saveDTO);
    List<StudentJoinClassDTO> importStudentJoinClassDataByYearCode(MultipartFile file);
    StudentJoinClassDTO updateStudentJoinClass(Long id, StudentJoinClassSaveDTO saveDTO);
    void deleteStudentJoinClass(Long id);
    List<TimeTableDTO> getStudentTimeTable(String studentId, int yearCode);
    Map<String, Integer> countOverlappingStudentsPerClass(int yearCode);
}
