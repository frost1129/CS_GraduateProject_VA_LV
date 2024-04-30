package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    Subject getBySubjectCode(String code);
}
