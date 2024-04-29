package com.nva.server.repositories;

import com.nva.server.models.SchoolYear;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SchoolYearRepository extends JpaRepository<SchoolYear, Long> {
    Optional<SchoolYear> findByYear(String year);
}
