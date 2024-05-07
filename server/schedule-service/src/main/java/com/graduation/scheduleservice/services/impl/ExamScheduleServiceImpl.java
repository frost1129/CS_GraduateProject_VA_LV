package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.dtos.TimeTableDTO;
import com.graduation.scheduleservice.models.ScheduledExam;
import com.graduation.scheduleservice.models.StudentJoinClass;
import com.graduation.scheduleservice.models.SubjectClass;
import com.graduation.scheduleservice.repositories.ScheduledExamRepository;
import com.graduation.scheduleservice.repositories.StudentJoinClassRepository;
import com.graduation.scheduleservice.services.ExamScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class ExamScheduleServiceImpl implements ExamScheduleService {

    private final ScheduledExamRepository examRepository;
    private final StudentJoinClassRepository joinClassRepository;

    @Override
    public List<ScheduledExam> saveExamSchedule(List<ScheduledExam> exams) {
        return this.examRepository.saveAll(exams);
    }

    @Override
    public List<TimeTableDTO> getExamScheduleByYearCode(int yearCode) {
        List<StudentJoinClass> joinClasses = joinClassRepository.getAllBySubjectClass_YearCode_YearCode(yearCode);
        List<SubjectClass> subjectClasses = joinClasses.stream()
                .map(StudentJoinClass::getSubjectClass)
                .toList();

        List<TimeTableDTO> timetableEntries = new ArrayList<>();
        for (SubjectClass subjectClass : subjectClasses) {
            ScheduledExam scheduledExam = examRepository.getScheduledExamBySubjectClass_Id(subjectClass.getId());

            if (scheduledExam == null) {
                continue;
            }

            TimeTableDTO dto = new TimeTableDTO();
            dto.setSubjectCode(subjectClass.getSubject().getSubjectCode());
            dto.setSubjectName(subjectClass.getSubject().getSubjectName());
            dto.setStartDate(scheduledExam.getExamDate());
            dto.setStartTime(scheduledExam.getTimeSlot().getStartHour());
            dto.setEndTime(scheduledExam.getTimeSlot().getEndHour());

            timetableEntries.add(dto);
        }

        return timetableEntries;
    }

    @Override
    public List<TimeTableDTO> getStudentExam(String studentId, int yearCode) {
        // 1. Find StudentJoinClass records based on studentId and yearCode
        List<StudentJoinClass> joinClasses = joinClassRepository.findByStudentIdAndSubjectClass_YearCode_YearCode(studentId, yearCode);

        // 2. Extract subjectClass IDs
        List<SubjectClass> subjectClasses = joinClasses.stream()
                .map(StudentJoinClass::getSubjectClass)
                .toList();

        // 3. Construct TimetableEntry objects
        List<TimeTableDTO> timetableEntries = new ArrayList<>();
        for (SubjectClass subjectClass : subjectClasses) {
            ScheduledExam scheduledExam = examRepository.getScheduledExamBySubjectClass_Id(subjectClass.getId());

            if (scheduledExam == null) {
                continue;
            }

            TimeTableDTO dto = new TimeTableDTO();
            dto.setSubjectCode(subjectClass.getSubject().getSubjectCode());
            dto.setSubjectName(subjectClass.getSubject().getSubjectName());
            dto.setStartDate(scheduledExam.getExamDate());
            dto.setStartTime(scheduledExam.getTimeSlot().getStartHour());
            dto.setEndTime(scheduledExam.getTimeSlot().getEndHour());

            timetableEntries.add(dto);
        }

        return timetableEntries;
    }
}
