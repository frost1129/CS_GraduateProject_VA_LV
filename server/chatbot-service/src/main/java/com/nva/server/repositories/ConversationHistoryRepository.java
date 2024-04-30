package com.nva.server.repositories;

import com.nva.server.models.ConversationHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ConversationHistoryRepository extends JpaRepository<ConversationHistory, Long> {
}
