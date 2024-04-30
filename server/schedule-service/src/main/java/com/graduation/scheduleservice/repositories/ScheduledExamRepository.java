package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.ScheduledExam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduledExamRepository extends JpaRepository<ScheduledExam, Long> {
}
