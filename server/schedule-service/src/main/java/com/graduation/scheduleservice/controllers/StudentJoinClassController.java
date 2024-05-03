package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.StudentJoinClassDTO;
import com.graduation.scheduleservice.dtos.TimeTableDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.services.StudentJoinClassService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/schedule-service/enroll")
@RequiredArgsConstructor
@CrossOrigin
public class StudentJoinClassController {

    private final StudentJoinClassService joinClassService;

    @GetMapping("/timetable")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<TimeTableDTO>> getStudentTimeTable(
            @RequestParam(name = "studentId") String studentId,
            @RequestParam(name = "yearCode") int yearCode
    ) {
        return new ResponseEntity<>(this.joinClassService.getStudentTimeTable(studentId, yearCode), HttpStatus.OK);
    }

    @GetMapping("/overlap")
    public ResponseEntity<Map<String, Integer>> countOverlapping(
            @RequestParam(name = "yearCode") int yearCode
    ) {
        return new ResponseEntity<>(this.joinClassService.countOverlappingStudentsPerClass(yearCode), HttpStatus.OK);
    }

    @PostMapping("/upload")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<StudentJoinClassDTO>> uploadEnrolments(@RequestParam(name = "file") MultipartFile file) {
        List<String> expectedHeaders = List.of("subjectCode", "studentId", "yearCode");

        try (InputStreamReader reader = new InputStreamReader(file.getInputStream())) {
            CSVFormat csvFormat = CSVFormat.DEFAULT;

            try (CSVParser csvParser = new CSVParser(reader, csvFormat)) {
                CSVRecord headerRecord = csvParser.iterator().next();
                List<String> actualHeaders = Arrays.stream(headerRecord.values()).toList();

                if (actualHeaders.equals(expectedHeaders)) {
                    return new ResponseEntity<>(this.joinClassService.importStudentJoinClassDataByYearCode(file),
                            HttpStatus.CREATED);
                } else {
                    throw new SaveDataException("File khong hop le!");
                }
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }
}
