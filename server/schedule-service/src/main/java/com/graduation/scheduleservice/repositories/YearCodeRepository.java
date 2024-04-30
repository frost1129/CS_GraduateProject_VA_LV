package com.graduation.scheduleservice.repositories;

import com.graduation.scheduleservice.models.YearCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface YearCodeRepository extends JpaRepository<YearCode, Long> {
    List<YearCode> getYearCodeBySchoolYear_Year(int year);
    YearCode getYearCodeByYearCode(int yearCode);
}
