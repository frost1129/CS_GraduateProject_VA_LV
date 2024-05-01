package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.constants.PagingSize;
import com.graduation.scheduleservice.dtos.SCScheduleDTO;
import com.graduation.scheduleservice.dtos.SubjectClassDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSaveDTO;
import com.graduation.scheduleservice.dtos.SubjectClassSearchResponse;
import com.graduation.scheduleservice.dtos.SubjectClassShortDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.StudentJoinClass;
import com.graduation.scheduleservice.models.Subject;
import com.graduation.scheduleservice.models.SubjectClass;
import com.graduation.scheduleservice.models.SubjectClassSchedule;
import com.graduation.scheduleservice.models.YearCode;
import com.graduation.scheduleservice.repositories.ScheduledExamRepository;
import com.graduation.scheduleservice.repositories.SubjectClassRepository;
import com.graduation.scheduleservice.repositories.SubjectClassScheduleRepository;
import com.graduation.scheduleservice.repositories.SubjectRepository;
import com.graduation.scheduleservice.repositories.YearCodeRepository;
import com.graduation.scheduleservice.services.SubjectClassService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.persistence.criteria.Subquery;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
    private final EntityManager entityManager;

    @Override
    public SubjectClassSearchResponse getListSubjectClass(Map<String, String> params) {
        SubjectClassSearchResponse response = new SubjectClassSearchResponse();
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();

        // Search Criteria
        CriteriaQuery<SubjectClass> query = cb.createQuery(SubjectClass.class);
        Root<SubjectClass> root = query.from(SubjectClass.class);
        List<Predicate> predicates = new ArrayList<>();

        // Standard Paging
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (page <= 0) page = 1;
        response.setCurrentPage(page);
        response.setPageSize(PagingSize.GENERAL_PAGESIZE);

        // Keyword Search
        if (params.containsKey("kw") && !params.get("kw").isEmpty()) {
            String keyword = params.get("kw");
            Join<SubjectClass, Subject> subjectJoin = root.join("subject");
            predicates.add(cb.or(
                    cb.like(subjectJoin.get("subjectName"), "%" + keyword + "%"),
                    cb.like(subjectJoin.get("subjectCode"), "%" + keyword + "%")
            ));
        }

        // Year Code Search
        if (params.containsKey("yearCode")) {
            int searchYearCode = Integer.parseInt(params.get("yearCode"));
            Join<SubjectClass, YearCode> yearCodeJoin = root.join("yearCode");
            predicates.add(cb.equal(yearCodeJoin.get("yearCode"), searchYearCode));
        }

        query.select(root).where(cb.and(predicates.toArray(new Predicate[0])));

        // Pagination
        TypedQuery<SubjectClass> typedQuery = entityManager.createQuery(query);
        int totalRecords = typedQuery.getResultList().size();
        typedQuery.setFirstResult((page - 1) * PagingSize.GENERAL_PAGESIZE);
        typedQuery.setMaxResults(PagingSize.GENERAL_PAGESIZE);

        // Fetch Results & Map to DTOs
        List<SubjectClassShortDTO> results = typedQuery.getResultList().stream()
                .map(subjectClass -> {
                    SubjectClassShortDTO dto = mapToShortDTO(subjectClass);
                    dto.setNumberOfStudents(
                            countSubjectClassStudent(cb, subjectClass.getId())
                    );
                    return dto;
                })
                .collect(Collectors.toList());

        response.setData(results);
        response.setTotalPages((int) Math.ceil((double) totalRecords / PagingSize.GENERAL_PAGESIZE));

        return response;
    }

    private int countSubjectClassStudent(CriteriaBuilder cb, Long subjectClassId) {
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);

        Root<StudentJoinClass> studentJoinClassRoot = cq.from(StudentJoinClass.class);
        cq.select(cb.count(studentJoinClassRoot));
        cq.where(cb.equal(studentJoinClassRoot.get("subjectClass").get("id"), subjectClassId));

        return entityManager.createQuery(cq).getSingleResult().intValue();
    }

    @Override
    public SubjectClassDTO getClassById(Long id) {
        return mapToDTO(this.classRepository.findById(id).orElseThrow());
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCode(int yearCode) {
        return this.classRepository.getAllByYearCode_YearCode(yearCode).stream().map(this::mapToDTO).collect(Collectors.toList());
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCodeOfStudent(int yearCode, String studentId) {
        // get from student-join-class repo
        return null;
    }

    @Override
    public List<SubjectClassDTO> getAllClassByYearCodeOfTeacher(int yearCode, String teacherId) {
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
            CSVFormat csvFormat = CSVFormat.DEFAULT
                    .builder().setHeader().setSkipHeaderRecord(true).build();

            CSVParser csvParser = new CSVParser(reader, csvFormat);

            List<SubjectClass> subjectClasses = new ArrayList<>();
            SubjectClass holder;
            SubjectClassSchedule scheduleHolder;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/uuuu");
            LocalDate localDate;

            for (CSVRecord csvRecord : csvParser) {
                holder = new SubjectClass();
                scheduleHolder = new SubjectClassSchedule();

                localDate = LocalDate.parse(csvRecord.get("startDate").toString(), formatter);

                scheduleHolder.setTeacherId(csvRecord.get("teacherId"));
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
        rs.setNote(subjectClass.getNote());
        rs.setCreatedDate(subjectClass.getCreatedDate());
        rs.setUpdatedDate(subjectClass.getUpdatedDate());
        return rs;
    }

    private SubjectClassShortDTO mapToShortDTO(SubjectClass subjectClass) {
        SubjectClassShortDTO rs = new SubjectClassShortDTO();
        SubjectClassSchedule ref = subjectClass.getSubjectClassSchedule();
        SCScheduleDTO scheduleDTO = new SCScheduleDTO(
                ref.getStartDate(), ref.getWeeks(), ref.getWeekday(),
                ref.getStartTimeSlot(), ref.getEndTimeSlot(),
                ref.getTeacherId(), ref.getCreatedDate(), ref.getUpdatedDate()
        );

        rs.setId(subjectClass.getId());
        rs.setSubject(subjectClass.getSubject().getSubjectName());
        rs.setSubjectClassSchedule(scheduleDTO);
        rs.setYearCode(subjectClass.getYearCode());
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
