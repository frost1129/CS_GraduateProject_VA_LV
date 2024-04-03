package com.nva.server.controllers;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;
import com.nva.server.services.ContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/chat-bot-service/contents")
@RequiredArgsConstructor
@CrossOrigin
public class ContentRestController {
    private final ContentService contentService;

    @GetMapping
    @PreAuthorize("hasAnyRole('USER', 'ADMIN')")
    public ResponseEntity<List<ContentResponse>> getContents() {
        return ResponseEntity.ok(contentService.findAll());
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponse> saveContent(@RequestBody ContentRequest contentRequest) {
        return new ResponseEntity<>(contentService.addOrUpdate(null, contentRequest), HttpStatus.CREATED);
    }

    @PatchMapping("/{contentId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponse> updateContent(@PathVariable("contentId") Long contentId, @RequestBody ContentRequest contentRequest) {
        return new ResponseEntity<>(contentService.addOrUpdate(contentId, contentRequest), HttpStatus.OK);
    }
}
