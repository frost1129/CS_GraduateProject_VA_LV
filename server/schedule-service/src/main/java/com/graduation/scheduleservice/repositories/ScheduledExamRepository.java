package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.ScheduledExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduledExamRepository extends JpaRepository<ScheduledExam, Long> {
    ScheduledExam getScheduledExamBySubjectClass_Id(Long id);
    List<ScheduledExam> getScheduledExamsBySubjectClass_YearCode_YearCode(int yearCode);
}
