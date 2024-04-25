package com.nva.server.controllers;

import com.nva.server.dtos.TopicResponse;
import com.nva.server.services.TopicService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/chat-bot-service/topics")
@RequiredArgsConstructor
@CrossOrigin
public class TopicRestController {
    private final TopicService topicService;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<TopicResponse>> getTopics(@RequestParam Map<String, String> params) {
        return ResponseEntity.ok(topicService.getTopics(params));
    }
}
