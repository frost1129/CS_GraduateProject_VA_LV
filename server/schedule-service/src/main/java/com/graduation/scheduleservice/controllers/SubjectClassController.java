package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.services.SubjectClassService;
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
@RequestMapping("/api/v1/schedule-service/subject-class")
@RequiredArgsConstructor
@CrossOrigin
public class SubjectClassController {

    private final SubjectClassService classService;

    @GetMapping("/by-code/{code}")
    public ResponseEntity<List<SubjectClassDTO>> getAllByYearCode(@PathVariable(name = "code") int yearCode) {
        return new ResponseEntity<>(this.classService.getAllClassByYearCode(yearCode), HttpStatus.OK);
    }

    @PostMapping("/upload/{year}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<SubjectClassDTO>> uploadSubjectClasses(
            @RequestParam(name = "file") MultipartFile file,
            @PathVariable(name = "year") int yearCode
            ) {
        List<String> expectedHeaders = List.of("subjectCode", "teacherId", "weekDay", "sessionS", "sessionE", "subjectLength", "startDate");

        try (InputStreamReader reader = new InputStreamReader(file.getInputStream())) {
            CSVFormat csvFormat = CSVFormat.DEFAULT;

            try (CSVParser csvParser = new CSVParser(reader, csvFormat)) {
                CSVRecord headerRecord = csvParser.iterator().next();
                List<String> actualHeaders = Arrays.stream(headerRecord.values()).toList();

                if (actualHeaders.equals(expectedHeaders)) {
                    return new ResponseEntity<>(this.classService.importSubjectClasses(
                            file, yearCode
                    ), HttpStatus.CREATED);
                } else {
                    throw new SaveDataException("File khong hop le!");
                }
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }
}
