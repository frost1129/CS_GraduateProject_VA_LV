package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.TimeTableDTO;
import com.graduation.scheduleservice.models.ScheduledExam;

import java.util.List;

public interface ExamScheduleService {
    List<ScheduledExam> saveExamSchedule(List<ScheduledExam> exams);

    List<TimeTableDTO> getStudentExam(String studentId, int yearCode);
}
