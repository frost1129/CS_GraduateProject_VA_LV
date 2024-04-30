package com.nva.server.controllers;

import com.nva.server.dtos.ConversationHistoryRequest;
import com.nva.server.dtos.ConversationHistoryResponse;
import com.nva.server.dtos.ConversationHistoryResponseV2;
import com.nva.server.services.ConversationHistoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/chat-bot-service/conversation-histories")
@RequiredArgsConstructor
@CrossOrigin
public class ConversationHistoryRestController {
    private final ConversationHistoryService conversationHistoryService;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ConversationHistoryResponseV2> getConversationHistories(@RequestParam Map<String, String> params) {
        return ResponseEntity.ok(conversationHistoryService.getConversationHistories(params));
    }

    @GetMapping("/self")
    @PreAuthorize("hasAnyRole('ADMIN', 'USER')")
    public ResponseEntity<?> getSelfConversationHistories(
            @RequestParam Map<String, String> params,
            @RequestHeader(value = "Authorization") String authorizationHeader
    ) {
        return ResponseEntity.ok(conversationHistoryService.getSelfConversationHistories(params, authorizationHeader.substring(7)));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'USER')")
    public ResponseEntity<ConversationHistoryResponse> addConversationHistory(@RequestBody ConversationHistoryRequest conversationHistoryRequest) {
        return new ResponseEntity<>(conversationHistoryService.addConversationHistory(conversationHistoryRequest), HttpStatus.CREATED);
    }

    @DeleteMapping("/{conversationHistoryId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> deleteConversationHistory(@PathVariable(name = "conversationHistoryId") String conversationHistoryId) {
        conversationHistoryService.deleteConversationHistory(Long.parseLong(conversationHistoryId));
        return ResponseEntity.ok(Collections.singletonMap("message", "Xóa lịch sử trò chuyện thành công!"));
    }
}
