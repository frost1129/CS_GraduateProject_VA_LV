package com.nva.server.controllers;

import com.nva.server.dtos.ContentRequest;
import com.nva.server.dtos.ContentResponse;
import com.nva.server.dtos.ContentResponseV3;
import com.nva.server.services.ContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/chat-bot-service/contents")
@RequiredArgsConstructor
@CrossOrigin
public class ContentRestController {
    private final ContentService contentService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<List<ContentResponse>> getContents(@RequestParam Map<String, String> params) {
        return ResponseEntity.ok(contentService.getContents(params));
    }

    @GetMapping("/v2")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResponseEntity<ContentResponseV3> getContentsV2(@RequestParam Map<String, String> params) {
        return ResponseEntity.ok(contentService.getContentsV2(params));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponse> saveContent(@RequestBody ContentRequest contentRequest) {
        contentRequest.setId(null);
        return new ResponseEntity<>(contentService.addOrUpdateContent(contentRequest), HttpStatus.CREATED);
    }

    @PatchMapping("/{contentId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponse> updateContent(
            @PathVariable("contentId") String contentId,
            @RequestBody ContentRequest contentRequest
    ) {
        contentRequest.setId(Long.parseLong(contentId));
        return new ResponseEntity<>(contentService.addOrUpdateContent(contentRequest), HttpStatus.OK);
    }

    @DeleteMapping("/{contentId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ContentResponseV3> deleteContent(@PathVariable(name = "contentId") String contentId) {
        contentService.deleteContent(Long.parseLong(contentId));
        return ResponseEntity.ok(contentService.getContentsV2(Collections.emptyMap()));
    }
}
