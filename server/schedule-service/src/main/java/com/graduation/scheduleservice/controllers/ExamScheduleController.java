package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.DNAResponse;
import com.graduation.scheduleservice.dtos.ScheduleRequest;
import com.graduation.scheduleservice.dtos.TimeTableDTO;
import com.graduation.scheduleservice.models.DNA;
import com.graduation.scheduleservice.models.ScheduledExam;
import com.graduation.scheduleservice.services.ExamScheduleService;
import com.graduation.scheduleservice.services.GeneticAlgorithmService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/schedule-service/exam-schedule")
@RequiredArgsConstructor
@CrossOrigin
public class ExamScheduleController {

    private final GeneticAlgorithmService gaService;
    private final ExamScheduleService examScheduleService;

    @GetMapping("/timetable")
    @PreAuthorize("hasAnyRole('ADMIN', 'USER')")
    public ResponseEntity<List<TimeTableDTO>> getStudentExam(
            @RequestParam(name = "studentId") String studentId,
            @RequestParam(name = "yearCode") int yearCode
    ) {
        return new ResponseEntity<>(this.examScheduleService.getStudentExam(studentId, yearCode), HttpStatus.OK);
    }

    @GetMapping("/timetable/{yearCode}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<TimeTableDTO>> getExamByYearCode(@PathVariable(name = "yearCode") int yearCode) {
        return new ResponseEntity<>(this.examScheduleService.getExamScheduleByYearCode(yearCode), HttpStatus.OK);
    }

    @PostMapping("/ga")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<DNAResponse> generateSchedule(@RequestBody ScheduleRequest request) {
        this.gaService.initAlgorithm(request.getYearCode(), request.getDate(), request.getLength(), request.getSize());
        int generation = 1;

        while (this.gaService.getBestResult().getFitness() > request.getMinFitness()) {
            this.gaService.doCrossOver(request.getMutationRate());
            generation++;
            if (generation++ == 1000)
                break;
        }

        return new ResponseEntity<>(mapDNAToResponse(this.gaService.getBestResult()), HttpStatus.OK);
    }

    @PostMapping("/schedule")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<ScheduledExam>> saveSchedule(@RequestBody DNAResponse dna) {
        List<ScheduledExam> examList = dna.getExamList();
        return new ResponseEntity<>(this.examScheduleService.saveExamSchedule(examList), HttpStatus.CREATED);
    }

    private DNAResponse mapDNAToResponse(DNA dna) {
        DNAResponse response = new DNAResponse();
        List<ScheduledExam> examList = dna.getExamSchedules().values().stream().toList();

        response.setExamList(examList);
        response.setEvaluate(dna.getEvaluate());
        response.setStartDate(dna.getStartDate());
        response.setTotalDays(dna.getTotalDays());
        response.setTotalClass(dna.getTotalClass());
        return response;
    }
}
