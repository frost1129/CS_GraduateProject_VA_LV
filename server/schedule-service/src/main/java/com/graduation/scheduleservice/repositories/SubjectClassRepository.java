package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.SubjectClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectClassRepository extends JpaRepository<SubjectClass, Long> {
    List<SubjectClass> getAllByYearCode_YearCode(int yearCode);
    List<SubjectClass> getAllByYearCode_YearCodeAndSubjectClassSchedule_TeacherId(int yearCode, Long teacherId);
    List<SubjectClass> getAllByYearCode_YearCodeAndSubject_Id(int yearCode, Long subjectId);
    SubjectClass getBySubject_SubjectCodeAndYearCode_YearCode(String subjectCode, int yearCode);
}
