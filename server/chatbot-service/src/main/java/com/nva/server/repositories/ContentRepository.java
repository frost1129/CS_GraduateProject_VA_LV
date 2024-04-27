package com.nva.server.repositories;

import com.nva.server.models.Content;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ContentRepository extends JpaRepository<Content, Long> {
    Optional<Content> findByIntentCode(String intentCode);
}
