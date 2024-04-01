package com.nva.server.controllers;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;
import com.nva.server.services.ContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/chat-bot/contents")
@RequiredArgsConstructor
@CrossOrigin
public class ContentRestController {
    private final ContentService contentService;

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponse> saveContent(@RequestBody ContentRequest contentRequest) {
        return new ResponseEntity<>(contentService.save(contentRequest), HttpStatus.CREATED);
    }
}
