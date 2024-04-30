package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.SchoolYear;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SchoolYearRepository extends JpaRepository<SchoolYear, Long> {
    SchoolYear getSchoolYearByYear(int year);
    boolean existsByYear(int year);
}
