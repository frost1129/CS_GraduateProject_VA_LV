package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.dtos.StudentJoinClassDTO;
import com.graduation.scheduleservice.dtos.StudentJoinClassSaveDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.StudentJoinClass;
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

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
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
    public List<Long> getAllStudentIdBySubjectClassId(Long subjectId) {
        return this.joinClassRepository.getAllBySubjectClass_Id(subjectId)
                .stream().map(StudentJoinClass::getStudentId)
                .collect(Collectors.toList());
    }

    @Override
    public List<StudentJoinClassDTO> getAllByYearCodeAndStudentId(int yearCode, Long studentId) {
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
            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader());

            List<StudentJoinClass> studentJoin = new ArrayList<>();
            StudentJoinClass holder;

            for (CSVRecord csvRecord : csvParser) {
                holder = new StudentJoinClass();
                holder.setStudentId(Long.parseLong(csvRecord.get("studentId")));
                holder.setSubjectClass(classRepository.getReferenceById(Long.parseLong(csvRecord.get("scheduleId"))));
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

    StudentJoinClassDTO mapToDTO(StudentJoinClass studentJoinClass) {
        StudentJoinClassDTO rs = new StudentJoinClassDTO();
        rs.setId(studentJoinClass.getId());
        rs.setStudentId(studentJoinClass.getStudentId());
        rs.setSubjectClass(studentJoinClass.getSubjectClass());
        rs.setTotalScore(studentJoinClass.getTotalScore());
        rs.setCreatedDate(studentJoinClass.getCreatedDate());
        rs.setUpdatedDate(studentJoinClass.getUpdatedDate());
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