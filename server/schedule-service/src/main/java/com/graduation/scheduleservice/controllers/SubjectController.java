package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.SubjectDTO;
import com.graduation.scheduleservice.dtos.SubjectSaveDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.services.SubjectService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api/v1/schedule-service/subject")
@RequiredArgsConstructor
@CrossOrigin
public class SubjectController {

    private final SubjectService subjectService;

    @GetMapping
    public ResponseEntity<List<SubjectDTO>> getAllSubject() {
        return new ResponseEntity<>(subjectService.getAllSubject(), HttpStatus.OK);
    }

    public ResponseEntity<SubjectDTO> getSubjectById(@PathVariable(name = "id") Long id) {
        return new ResponseEntity<>(subjectService.getSubjectById(id), HttpStatus.OK);
    }

    public ResponseEntity<SubjectDTO> getSubjectByCode(@PathVariable(name = "code") String code) {
        return new ResponseEntity<>(subjectService.getSubjectByCode(code), HttpStatus.OK);
    }

    public ResponseEntity<SubjectDTO> addSubject(@RequestBody SubjectSaveDTO subject) {
        return new ResponseEntity<>(subjectService.addOrUpdateSubject(null, subject), HttpStatus.CREATED);
    }

    public ResponseEntity<SubjectDTO> updateSubject(@PathVariable(name = "id") Long id, @RequestBody SubjectSaveDTO subject) {
        return new ResponseEntity<>(subjectService.addOrUpdateSubject(id, subject), HttpStatus.OK);
    }

    @PostMapping("/upload")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<SubjectDTO>> uploadSubjects(@RequestParam(name = "file") MultipartFile file) {
        List<String> expectedHeaders = List.of("code", "name", "credit", "note");

        try (InputStreamReader reader = new InputStreamReader(file.getInputStream())) {
            CSVFormat csvFormat = CSVFormat.DEFAULT;

            try (CSVParser csvParser = new CSVParser(reader, csvFormat)) {
                CSVRecord headerRecord = csvParser.iterator().next();
                List<String> actualHeaders = Arrays.stream(headerRecord.values()).toList();

                if (actualHeaders.equals(expectedHeaders)) {
                    return new ResponseEntity<>(this.subjectService.importSubjects(file), HttpStatus.CREATED);
                } else {
                    return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
                }
            }
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

}
