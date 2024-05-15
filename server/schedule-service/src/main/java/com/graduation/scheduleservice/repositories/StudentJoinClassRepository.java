package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.StudentJoinClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentJoinClassRepository extends JpaRepository<StudentJoinClass, Long> {
    List<StudentJoinClass> getAllBySubjectClass_Id(Long subjectId);
    List<StudentJoinClass> getAllBySubjectClass_YearCode_YearCode(int yearCode);
    List<StudentJoinClass> getAllBySubjectClass_YearCode_YearCodeAndStudentId(int yearCode, String studentId);
    List<StudentJoinClass> getAllBySubjectClass_YearCode_YearCodeAndSubjectClass_Id(int yearCode, Long classId);
    List<StudentJoinClass> findByStudentIdAndSubjectClass_YearCode_YearCode(String studentId, int yearCode);
    @Query("SELECT j.studentId, j.subjectClass.id, j.subjectClass.subject.subjectCode " +
            "FROM StudentJoinClass j " +
            "WHERE j.subjectClass.yearCode.yearCode = :yearCode")
    List<Object[]> findStudentAndSubjectCodesByYearCode(int yearCode);
}
