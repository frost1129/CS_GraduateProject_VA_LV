package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.models.ScheduledExam;
import com.graduation.scheduleservice.repositories.ScheduledExamRepository;
import com.graduation.scheduleservice.services.ExamScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class ExamScheduleServiceImpl implements ExamScheduleService {

    private final ScheduledExamRepository examRepository;

    @Override
    public List<ScheduledExam> saveExamSchedule(List<ScheduledExam> exams) {
        return this.examRepository.saveAll(exams);
    }
}
