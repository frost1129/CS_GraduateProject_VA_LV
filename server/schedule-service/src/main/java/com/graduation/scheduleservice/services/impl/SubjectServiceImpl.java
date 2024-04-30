package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.dtos.SubjectDTO;
import com.graduation.scheduleservice.dtos.SubjectSaveDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.Subject;
import com.graduation.scheduleservice.repositories.SubjectRepository;
import com.graduation.scheduleservice.services.SubjectService;
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
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class SubjectServiceImpl implements SubjectService {

    private final SubjectRepository subjectRepository;

    @Override
    public List<SubjectDTO> getAllSubject() {
        return this.subjectRepository.findAll().stream().map(this::mapToSubjectDTO).collect(Collectors.toList());
    }

    @Override
    public SubjectDTO getSubjectById(Long id) {
        return mapToSubjectDTO(this.subjectRepository.findById(id).orElseThrow());
    }

    @Override
    public SubjectDTO getSubjectByCode(String code) {
        return mapToSubjectDTO(this.subjectRepository.getBySubjectCode(code));
    }

    @Override
    public SubjectDTO addOrUpdateSubject(Long id, SubjectSaveDTO saveDTO) {
        try {
            if (id == null) {
                return mapToSubjectDTO(this.subjectRepository.save(Objects.requireNonNull(mapToSubject(saveDTO))));
            }

            Optional<Subject> actualSubject = this.subjectRepository.findById(id);
            if (actualSubject.isEmpty()) {
                throw new SaveDataException("Phòng học với ID đã nhập không tồn tại");
            }

            actualSubject.get().setSubjectCode(saveDTO.getSubjectCode());
            actualSubject.get().setSubjectName(saveDTO.getSubjectName());
            actualSubject.get().setCredits(saveDTO.getCredits());
            actualSubject.get().setNote(saveDTO.getNote());
            actualSubject.get().setUpdatedDate(System.currentTimeMillis());

            return mapToSubjectDTO(this.subjectRepository.save(actualSubject.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public List<SubjectDTO> importSubjects(MultipartFile file) {
        try {
            InputStream inputStream = file.getInputStream();
            Reader reader = new BufferedReader(new InputStreamReader(inputStream));
            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader());

            List<Subject> subjects = new ArrayList<>();
            Subject holder;

            for (CSVRecord csvRecord : csvParser) {
                String subjectCode = csvRecord.get("code");
                String subjectName = csvRecord.get("name");
                float credit = Float.parseFloat(csvRecord.get("credit"));

                holder = new Subject();
                holder.setSubjectCode(subjectCode);
                holder.setSubjectName(subjectName);
                holder.setCredits(credit);
                subjects.add(holder);
            }

            csvParser.close();
            reader.close();
            return this.subjectRepository.saveAll(subjects).stream().map(this::mapToSubjectDTO).collect(Collectors.toList());
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public void deleteSubject(Long id) {
        try {
            this.subjectRepository.deleteById(id);
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    private SubjectDTO mapToSubjectDTO(Subject subject) {
        SubjectDTO rs = new SubjectDTO();
        rs.setId(subject.getId());
        rs.setSubjectCode(subject.getSubjectCode());
        rs.setSubjectName(subject.getSubjectName());
        rs.setCredits(subject.getCredits());
        rs.setNote(subject.getNote());
        rs.setCreatedDate(subject.getCreatedDate());
        rs.setUpdatedDate(subject.getUpdatedDate());
        return rs;
    }

    private Subject mapToSubject(SubjectSaveDTO saveDTO) {
        Subject rs = new Subject();
        rs.setSubjectCode(saveDTO.getSubjectCode());
        rs.setSubjectName(saveDTO.getSubjectName());
        rs.setCredits(saveDTO.getCredits());
        rs.setNote(saveDTO.getNote());
        return null;
    }
}
