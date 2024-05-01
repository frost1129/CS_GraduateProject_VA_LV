package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSaveDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.SubjectClass;
import com.graduation.scheduleservice.models.SubjectClassSchedule;
import com.graduation.scheduleservice.repositories.*;
import com.graduation.scheduleservice.services.SubjectClassService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class SubjectClassServiceImpl implements SubjectClassService {

    private final SubjectRepository subjectRepository;
    private final SubjectClassRepository classRepository;
    private final SubjectClassScheduleRepository classScheduleRepository;
    private final ScheduledExamRepository examRepository;
    private final YearCodeRepository yearCodeRepository;

    @Override
    public SubjectClassDTO getClassById(Long id) {
        return mapToDTO(this.classRepository.findById(id).orElseThrow());
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCode(int yearCode) {
        return this.classRepository.getAllByYearCode_YearCode(yearCode).stream().map(this::mapToDTO).collect(Collectors.toList());
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCodeOfStudent(int yearCode, Long studentId) {
        // get from student-join-class repo
        return null;
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCodeOfTeacher(int yearCode, Long teacherId) {
        return this.classRepository.getAllByYearCode_YearCodeAndSubjectClassSchedule_TeacherId(yearCode, teacherId)
                .stream().map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCodeAndSubject(int yearCode, Long subjectId) {
        return this.classRepository.getAllByYearCode_YearCodeAndSubject_Id(yearCode, subjectId)
                .stream().map(this::mapToDTO)
                .collect(Collectors.toList());
    }

    @Override
    public SubjectClassDTO addSubjectClass(SubjectClassSaveDTO saveDTO) {
        return mapToDTO(this.classRepository.save(mapToSubjectClass(saveDTO)));
    }

    @Override
    public List<SubjectClassDTO> importSubjectClasses(MultipartFile file, int yearCode) {
        try {
            InputStream inputStream = file.getInputStream();
            Reader reader = new BufferedReader(new InputStreamReader(inputStream));
            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader());

            List<SubjectClass> subjectClasses = new ArrayList<>();
            SubjectClass holder;
            SubjectClassSchedule scheduleHolder;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/uuuu");
            LocalDate localDate;

            for (CSVRecord csvRecord : csvParser) {
                holder = new SubjectClass();
                scheduleHolder = new SubjectClassSchedule();

                localDate = LocalDate.parse(csvRecord.get("startDate").toString(), formatter);

                scheduleHolder.setTeacherId(Long.parseLong(csvRecord.get("teacherId")));
                scheduleHolder.setWeekday(Integer.parseInt(csvRecord.get("weekDay")));
                scheduleHolder.setWeeks(Integer.parseInt(csvRecord.get("subjectLength")));
                scheduleHolder.setStartTimeSlot(Integer.parseInt(csvRecord.get("sessionS")));
                scheduleHolder.setEndTimeSlot(Integer.parseInt(csvRecord.get("sessionE")));
                scheduleHolder.setStartDate(localDate);
                scheduleHolder.setSubjectClass(holder);
                scheduleHolder.setCreatedDate(System.currentTimeMillis());

                holder.setSubject(subjectRepository.getBySubjectCode(csvRecord.get("subjectCode")));
                holder.setYearCode(yearCodeRepository.getYearCodeByYearCode(yearCode));
                holder.setSubjectClassSchedule(scheduleHolder);
                holder.setCreatedDate(System.currentTimeMillis());

                subjectClasses.add(holder);
            }

            csvParser.close();
            reader.close();
            return this.classRepository.saveAll(subjectClasses).stream().map(this::mapToDTO).collect(Collectors.toList());
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public SubjectClassDTO updateSubjectClass(Long classId, SubjectClassSaveDTO saveDTO) {
        try {
            Optional<SubjectClass> actualClass = this.classRepository.findById(classId);
            if (actualClass.isEmpty()) {
                throw new SaveDataException("TODO");
            }

            actualClass.get().setSubjectClassSchedule(saveDTO.getSubjectClassSchedule());
            actualClass.get().setScheduledExam(saveDTO.getScheduledExam());
            actualClass.get().setYearCode(saveDTO.getYearCode());
            actualClass.get().setSubject(saveDTO.getSubject());
            actualClass.get().setNote(saveDTO.getNote());
            actualClass.get().setUpdatedDate(System.currentTimeMillis());

            return mapToDTO(this.classRepository.save(actualClass.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public void deleteSubjectClass(Long id) {
        try {
            Optional<SubjectClass> actualClass = this.classRepository.findById(id);
            if (actualClass.isEmpty()) {
                return;
            }

            this.examRepository.deleteById(actualClass.get().getScheduledExam().getId());
            this.classScheduleRepository.deleteById(actualClass.get().getSubjectClassSchedule().getId());
            // Xóa thông tin student-join-class
            this.classRepository.deleteById(id);
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    private SubjectClassDTO mapToDTO(SubjectClass subjectClass) {
        SubjectClassDTO rs = new SubjectClassDTO();
        rs.setId(subjectClass.getId());
        rs.setSubject(subjectClass.getSubject());
        rs.setSubjectClassSchedule(subjectClass.getSubjectClassSchedule());
        rs.setYearCode(subjectClass.getYearCode());
        rs.setScheduledExam(subjectClass.getScheduledExam());
        rs.setNote(subjectClass.getNote());
        rs.setCreatedDate(subjectClass.getCreatedDate());
        rs.setUpdatedDate(subjectClass.getUpdatedDate());
        return rs;
    }

    private SubjectClass mapToSubjectClass(SubjectClassSaveDTO saveDTO) {
        SubjectClass rs = new SubjectClass();
        rs.setSubject(saveDTO.getSubject());
        rs.setSubjectClassSchedule(saveDTO.getSubjectClassSchedule());
        rs.setYearCode(saveDTO.getYearCode());
        rs.setScheduledExam(saveDTO.getScheduledExam());
        rs.setNote(saveDTO.getNote());
        return rs;
    }
}
