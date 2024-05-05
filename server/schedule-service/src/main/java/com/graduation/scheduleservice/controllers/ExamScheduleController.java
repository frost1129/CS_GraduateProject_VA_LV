package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.ScheduleRequest;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/schedule-service/exam-schedule")
@RequiredArgsConstructor
@CrossOrigin
public class ExamScheduleController {

    private final GeneticAlgorithmService gaService;
    private final ExamScheduleService examScheduleService;

    @PostMapping("/ga")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<DNA> generateSchedule(@RequestBody ScheduleRequest request) {
        this.gaService.initAlgorithm(request.getYearCode(), request.getDate(), request.getLength(), request.getSize());
        int generation = 1;

        while (this.gaService.getBestResult().getFitness() > 1) {
            this.gaService.doCrossOver(request.getMutationRate());
            generation++;
//            if (generation++ == 100)
//                break;
        }

//        List<ScheduledExam> scheduledExams = new ArrayList<>(this.GA.getBestResult().getExamSchedules().values());
//        this.examService.saveAllScheduledExams(scheduledExams);

        return new ResponseEntity<>(this.gaService.getBestResult(), HttpStatus.OK);
    }

    @PostMapping("/schedule")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<ScheduledExam>> saveSchedule(@RequestBody DNA dna) {
        List<ScheduledExam> examList = dna.getExamSchedules().values().stream().toList();
        return new ResponseEntity<>(this.examScheduleService.saveExamSchedule(examList), HttpStatus.CREATED);
    }
}
