package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.SubjectClassSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectClassScheduleRepository extends JpaRepository<SubjectClassSchedule, Long> {
}
