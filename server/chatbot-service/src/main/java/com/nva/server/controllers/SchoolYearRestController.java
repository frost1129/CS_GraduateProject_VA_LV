package com.nva.server.controllers;

import com.nva.server.dtos.*;
import com.nva.server.services.ContentService;
import com.nva.server.services.SchoolYearService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/chat-bot-service/schoolYears")
@RequiredArgsConstructor
@CrossOrigin
public class SchoolYearRestController {
    private final SchoolYearService schoolYearService;

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<SchoolYearResponseV3> getSchoolYears(@RequestParam Map<String, String> params) {
        return ResponseEntity.ok(schoolYearService.getSchoolYears(params));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<SchoolYearResponse> saveSchoolYear(@RequestBody SchoolYearRequest schoolYearRequest) {
        schoolYearRequest.setId(null);
        return new ResponseEntity<>(schoolYearService.addOrUpdateSchoolYear(schoolYearRequest), HttpStatus.CREATED);
    }

    @PatchMapping("/{schoolYearId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<SchoolYearResponse> updateSchoolYear(
            @PathVariable("schoolYearId") String schoolYearId,
            @RequestBody SchoolYearRequest schoolYearRequest
    ) {
        schoolYearRequest.setId(Long.parseLong(schoolYearId));
        return new ResponseEntity<>(schoolYearService.addOrUpdateSchoolYear(schoolYearRequest), HttpStatus.OK);
    }

    @DeleteMapping("/{schoolYearId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> deleteSchoolYear(@PathVariable(name = "schoolYearId") String schoolYearId) {
        schoolYearService.deleteSchoolYear(Long.parseLong(schoolYearId));
        return ResponseEntity.ok(Collections.singletonMap("message", "Xóa năm học thành công!"));
    }
}
