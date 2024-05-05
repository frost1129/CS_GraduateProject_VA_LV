package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.constants.TimeSlotConstant;
import com.graduation.scheduleservice.dtos.StudentJoinClassDTO;
import com.graduation.scheduleservice.dtos.StudentJoinClassSaveDTO;
import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.TimeTableDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.StudentJoinClass;
import com.graduation.scheduleservice.models.SubjectClass;
import com.graduation.scheduleservice.models.SubjectClassSchedule;
import com.graduation.scheduleservice.repositories.StudentJoinClassRepository;
import com.graduation.scheduleservice.repositories.SubjectClassRepository;
import com.graduation.scheduleservice.services.StudentJoinClassService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class StudentJoinClassServiceImpl implements StudentJoinClassService {

    private final StudentJoinClassRepository joinClassRepository;
    private final SubjectClassRepository classRepository;

    @Override
    public StudentJoinClassDTO getById(Long id) {
        return mapToDTO(this.joinClassRepository.findById(id).orElseThrow());
    }

    @Override
    public List<String> getAllStudentIdBySubjectClassId(Long subjectId) {
        return this.joinClassRepository.getAllBySubjectClass_Id(subjectId)
                .stream().map(StudentJoinClass::getStudentId)
                .collect(Collectors.toList());
    }

    @Override
    public List<StudentJoinClassDTO> getAllByYearCodeAndStudentId(int yearCode, String studentId) {
        return this.joinClassRepository.getAllBySubjectClass_YearCode_YearCodeAndStudentId(yearCode, studentId)
                .stream().map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<StudentJoinClassDTO> getAllByYearCodeAndSubjectClassId(int yearCode, Long subjectId) {
        return this.joinClassRepository.getAllBySubjectClass_YearCode_YearCodeAndSubjectClass_Id(yearCode, subjectId)
                .stream().map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public StudentJoinClassDTO addStudentJoinClass(StudentJoinClassSaveDTO saveDTO) {
        return mapToDTO(this.joinClassRepository.save(mapToStudentJoinClass(saveDTO)));
    }

    @Override
    public List<StudentJoinClassDTO> importStudentJoinClassDataByYearCode(MultipartFile file) {
        try {
            InputStream inputStream = file.getInputStream();
            Reader reader = new BufferedReader(new InputStreamReader(inputStream));
            CSVFormat csvFormat = CSVFormat.DEFAULT
                    .builder().setHeader().setSkipHeaderRecord(true).build();

            CSVParser csvParser = new CSVParser(reader, csvFormat);

            List<StudentJoinClass> studentJoin = new ArrayList<>();
            StudentJoinClass holder;

            for (CSVRecord csvRecord : csvParser) {
                holder = new StudentJoinClass();
                holder.setStudentId(csvRecord.get("studentId"));
                holder.setSubjectClass(classRepository.getBySubject_SubjectCodeAndYearCode_YearCode(
                        csvRecord.get("subjectCode"), Integer.parseInt(csvRecord.get("yearCode"))
                ));
                studentJoin.add(holder);
            }

            csvParser.close();
            reader.close();
            return this.joinClassRepository.saveAll(studentJoin).stream().map(this::mapToDTO).collect(Collectors.toList());
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public StudentJoinClassDTO updateStudentJoinClass(Long id, StudentJoinClassSaveDTO saveDTO) {
        try {
            Optional<StudentJoinClass> actualEnroll = this.joinClassRepository.findById(id);
            if (actualEnroll.isEmpty()) {
                throw new SaveDataException("Phòng học với ID đã nhập không tồn tại");
            }

            actualEnroll.get().setStudentId(saveDTO.getStudentId());
            actualEnroll.get().setSubjectClass(saveDTO.getSubjectClass());
            actualEnroll.get().setTotalScore(saveDTO.getTotalScore());
            actualEnroll.get().setUpdatedDate(System.currentTimeMillis());

            return mapToDTO(this.joinClassRepository.save(actualEnroll.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public void deleteStudentJoinClass(Long id) {
        try {
            this.joinClassRepository.deleteById(id);
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public List<TimeTableDTO> getStudentTimeTable(String studentId, int yearCode) {
        // 1. Find StudentJoinClass records based on studentId and yearCode
        List<StudentJoinClass> joinClasses = joinClassRepository.findByStudentIdAndSubjectClass_YearCode_YearCode(studentId, yearCode);

        // 2. Extract subjectClass IDs
        List<Long> subjectClassIds = joinClasses.stream()
                .map(StudentJoinClass::getSubjectClass)
                .map(SubjectClass::getId)
                .collect(Collectors.toList());

        // 3. Find SubjectClass and associated SubjectClassSchedules
        List<SubjectClass> subjectClasses = classRepository.findAllById(subjectClassIds);

        // 4. Construct TimetableEntry objects
        List<TimeTableDTO> timetableEntries = new ArrayList<>();
        for (SubjectClass subjectClass : subjectClasses) {
            SubjectClassSchedule schedule = subjectClass.getSubjectClassSchedule();

            TimeTableDTO entry = new TimeTableDTO(
                    subjectClass.getSubject().getSubjectCode(),
                    subjectClass.getSubject().getSubjectName(),
                    schedule.getStartDate(),
                    schedule.getWeeks(),
                    schedule.getWeekday(),
                    TimeSlotConstant.getLocalTimeFromSlot(schedule.getStartTimeSlot()),
                    TimeSlotConstant.getLocalTimeFromSlot(schedule.getEndTimeSlot())
            );
            timetableEntries.add(entry);
        }

        return timetableEntries;
    }

    public Map<String, Integer> countOverlappingStudentsPerClass(int yearCode) {
        Map<String, Integer> classOverlapCounts = new HashMap<>();

        // Get all SubjectClass entities
        List<SubjectClass> subjectClasses = classRepository.findByYearCode_YearCode(yearCode);

        for (SubjectClass currentClass : subjectClasses) {
            int overlappingClasses = 0;

            // Get students enrolled in the current class
            Set<String> currentClassStudents = joinClassRepository
                    .findAllBySubjectClass_IdAndSubjectClass_YearCode_YearCode(currentClass.getId(), yearCode)
                    .stream()
                    .map(StudentJoinClass::getStudentId)
                    .collect(Collectors.toSet());

            // Compare with students in other classes
            for (SubjectClass otherClass : subjectClasses) {
                if (!currentClass.equals(otherClass)) {
                    Set<String> otherClassStudents = joinClassRepository
                            .findAllBySubjectClass_IdAndSubjectClass_YearCode_YearCode(otherClass.getId(), yearCode)
                            .stream()
                            .map(StudentJoinClass::getStudentId)
                            .collect(Collectors.toSet());

                    // Check if there's any overlap
                    if (!Collections.disjoint(currentClassStudents, otherClassStudents)) {
                        overlappingClasses++;
                    }
                }
            }

            classOverlapCounts.put(currentClass.getSubject().getSubjectCode(), overlappingClasses);
        }

        return classOverlapCounts;
    }

    StudentJoinClassDTO mapToDTO(StudentJoinClass studentJoinClass) {
        StudentJoinClassDTO rs = new StudentJoinClassDTO();
        rs.setId(studentJoinClass.getId());
        rs.setStudentId(studentJoinClass.getStudentId());
        rs.setSubjectClass(this.mapToSCDTO(studentJoinClass.getSubjectClass()));
        rs.setTotalScore(studentJoinClass.getTotalScore());
        rs.setCreatedDate(studentJoinClass.getCreatedDate());
        rs.setUpdatedDate(studentJoinClass.getUpdatedDate());
        return rs;
    }

    private SubjectClassDTO mapToSCDTO(SubjectClass subjectClass) {
        SubjectClassDTO rs = new SubjectClassDTO();
        rs.setId(subjectClass.getId());
        rs.setSubject(subjectClass.getSubject());
        rs.setSubjectClassSchedule(subjectClass.getSubjectClassSchedule());
        rs.setYearCode(subjectClass.getYearCode());
        rs.setNote(subjectClass.getNote());
        rs.setCreatedDate(subjectClass.getCreatedDate());
        rs.setUpdatedDate(subjectClass.getUpdatedDate());
        return rs;
    }

    StudentJoinClass mapToStudentJoinClass(StudentJoinClassSaveDTO dto) {
        StudentJoinClass rs = new StudentJoinClass();
        rs.setStudentId(dto.getStudentId());
        rs.setSubjectClass(dto.getSubjectClass());
        rs.setTotalScore(dto.getTotalScore());
        return rs;
    }
}