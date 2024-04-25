package com.nva.server.controllers;

import com.nva.server.dtos.TopicRequest;
import com.nva.server.dtos.TopicResponse;
import com.nva.server.services.TopicService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
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

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<TopicResponse> addNewTopic(@RequestBody TopicRequest topicRequest) {
        topicRequest.setId(null);
        return new ResponseEntity<>(topicService.addOrUpdateTopic(topicRequest), HttpStatus.CREATED);
    }

    @PatchMapping("/{topicId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<TopicResponse> updateTopic(@PathVariable(name = "topicId") String topicId, @RequestBody TopicRequest topicRequest) {
        topicRequest.setId(Long.parseLong(topicId));
        return ResponseEntity.ok(topicService.addOrUpdateTopic(topicRequest));
    }

    @DeleteMapping("/{topicId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> deleteTopic(@PathVariable(name = "topicId") String topicId) {
        topicService.deleteTopic(Long.parseLong(topicId));
        return ResponseEntity.ok(Collections.singletonMap("message", "Xóa chủ đề thành công!"));
    }
}
