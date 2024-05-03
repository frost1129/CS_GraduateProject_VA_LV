package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.StudentJoinClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentJoinClassRepository extends JpaRepository<StudentJoinClass, Long> {
    List<StudentJoinClass> getAllBySubjectClass_Id(Long subjectId);
    List<StudentJoinClass> getAllBySubjectClass_YearCode_YearCodeAndStudentId(int yearCode, String studentId);
    List<StudentJoinClass> getAllBySubjectClass_YearCode_YearCodeAndSubjectClass_Id(int yearCode, Long classId);
    List<StudentJoinClass> findByStudentIdAndSubjectClass_YearCode_YearCode(String studentId, int yearCode);
    List<StudentJoinClass> findAllBySubjectClass_IdAndSubjectClass_YearCode_YearCode(Long subjectClassId, int yearCode);
}
