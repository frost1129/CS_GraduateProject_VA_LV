package com.graduation.scheduleservice.services.impl;

import com.graduation.scheduleservice.dtos.RoomDTO;
import com.graduation.scheduleservice.dtos.RoomSaveDTO;
import com.graduation.scheduleservice.dtos.SchoolYearDTO;
import com.graduation.scheduleservice.dtos.SchoolYearSaveDTO;
import com.graduation.scheduleservice.dtos.TimeSlotDTO;
import com.graduation.scheduleservice.dtos.TimeSlotSaveDTO;
import com.graduation.scheduleservice.dtos.YearCodeDTO;
import com.graduation.scheduleservice.exceptions.SaveDataException;
import com.graduation.scheduleservice.models.Room;
import com.graduation.scheduleservice.models.SchoolYear;
import com.graduation.scheduleservice.models.TimeSlot;
import com.graduation.scheduleservice.models.YearCode;
import com.graduation.scheduleservice.repositories.RoomRepository;
import com.graduation.scheduleservice.repositories.SchoolYearRepository;
import com.graduation.scheduleservice.repositories.TimeSlotRepository;
import com.graduation.scheduleservice.repositories.YearCodeRepository;
import com.graduation.scheduleservice.services.MasterSettingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class MasterSettingServiceImpl implements MasterSettingService {

    private final RoomRepository roomRepository;
    private final SchoolYearRepository schoolYearRepository;
    private final TimeSlotRepository timeSlotRepository;
    private final YearCodeRepository yearCodeRepository;

    @Override
    public List<RoomDTO> getAllRoom() {
        return this.roomRepository.findAll().stream().map(this::mapToRoomDTO).collect(Collectors.toList());
    }

    @Override
    public RoomDTO getRoomById(Long roomId) {
        return this.roomRepository.findById(roomId).map(this::mapToRoomDTO).orElseThrow();
    }

    @Override
    public List<RoomDTO> getRoomByCode(String roomCode) {
        return this.roomRepository.findRoomByRoomCode(roomCode).stream().map(this::mapToRoomDTO).collect(Collectors.toList());
    }

    @Override
    public RoomDTO addOrUpdateRoom(Long roomId, RoomSaveDTO room) {
        try {
            if (roomId == null) {
                return mapToRoomDTO(this.roomRepository.save(mapToRoom(room)));
            }

            Optional<Room> actualRoom = this.roomRepository.findById(roomId);
            if (actualRoom.isEmpty()) {
                throw new SaveDataException("Phòng học với ID đã nhập không tồn tại");
            }

            actualRoom.get().setRoomCode(room.getRoomCode());
            actualRoom.get().setRoomName(room.getRoomName());
            actualRoom.get().setNote(room.getNote());
            actualRoom.get().setUpdatedDate(System.currentTimeMillis());

            return mapToRoomDTO(this.roomRepository.save(actualRoom.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public List<SchoolYearDTO> getAllSchoolYear() {
        return this.schoolYearRepository.findAll().stream().map(this::mapToSchoolYearDTO).collect(Collectors.toList());
    }

    @Override
    public SchoolYearDTO getSchoolYearById(Long yearId) {
        return this.schoolYearRepository.findById(yearId).map(this::mapToSchoolYearDTO).orElseThrow();
    }

    @Override
    public SchoolYearDTO getSchoolYear(int schoolYear) {
        return mapToSchoolYearDTO(this.schoolYearRepository.getSchoolYearByYear(schoolYear));
    }

    @Override
    public SchoolYearDTO addOrUpdateSchoolYear(Long yearId, SchoolYearSaveDTO schoolYear) {
        try {
            if (yearId == null) {
                if (this.schoolYearRepository.existsByYear(schoolYear.getYear())) {
                    throw new SaveDataException("Đã tồn tại năm học tương ứng với năm vừa nhập");
                }

                SchoolYearDTO result = mapToSchoolYearDTO(this.schoolYearRepository.save(mapToSchoolYear(schoolYear)));

                // Add yearCode according to schoolYear
                YearCode newYearCode;

                for (int i = 1; i <= 3; i++) {
                    newYearCode = new YearCode();
                    newYearCode.setSchoolYear(schoolYearRepository.getReferenceById(result.getId()));
                    newYearCode.setSemester(i);
                    newYearCode.setYearCode(newYearCode.calcYearCode());
                    this.yearCodeRepository.save(newYearCode);
                }

                return result;
            }

            Optional<SchoolYear> actualYear = this.schoolYearRepository.findById(yearId);
            if (actualYear.isEmpty()) {
                throw new SaveDataException("Không tồn tại năm học với Id đã nhập!");
            }

            if (actualYear.get().getYear() != schoolYear.getYear()) {
                throw new SaveDataException("Không được phép cập nhật năm!");
            }

            actualYear.get().setNote(schoolYear.getNote());
            actualYear.get().setUpdatedDate(System.currentTimeMillis());

            return mapToSchoolYearDTO(this.schoolYearRepository.save(actualYear.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public List<TimeSlotDTO> getAllTimeSlot() {
        return this.timeSlotRepository.findAll().stream().map(this::mapToTimeSlotDTO).collect(Collectors.toList());
    }

    @Override
    public TimeSlotDTO getTimeSlotById(Long timeSlotId) {
        return this.timeSlotRepository.findById(timeSlotId).map(this::mapToTimeSlotDTO).orElseThrow();
    }

    @Override
    public TimeSlotDTO addOrUpdateTimeSlot(TimeSlotSaveDTO timeSlot) {
        try {
            Optional<TimeSlot> actualSlot = this.timeSlotRepository.findById(timeSlot.getId());
            if (actualSlot.isEmpty()) {
                return mapToTimeSlotDTO(this.timeSlotRepository.save(mapToTimeSlot(timeSlot)));
            }

            actualSlot.get().setStartHour(LocalTime.parse(timeSlot.getStartTime()));
            actualSlot.get().setEndHour(LocalTime.parse(timeSlot.getEndTime()));
            actualSlot.get().setUpdatedDate(System.currentTimeMillis());

            return mapToTimeSlotDTO(this.timeSlotRepository.save(actualSlot.get()));
        } catch (Exception e) {
            throw new SaveDataException(e.getMessage());
        }
    }

    @Override
    public List<YearCodeDTO> getYearCodeByYear(int year) {
        return this.yearCodeRepository.getYearCodeBySchoolYear_Year(year).stream().map(this::mapToYearCodeDTO).collect(Collectors.toList());
    }

    @Override
    public YearCodeDTO getYearCode(int yearCode) {
        return mapToYearCodeDTO(this.yearCodeRepository.getYearCodeByYearCode(yearCode));
    }

    private RoomDTO mapToRoomDTO(Room room) {
        RoomDTO rs = new RoomDTO();
        rs.setId(room.getId());
        rs.setRoomCode(room.getRoomCode());
        rs.setRoomName(room.getRoomName());
        rs.setCreatedDate(room.getCreatedDate());
        rs.setUpdatedDate(room.getUpdatedDate());
        rs.setNote(room.getNote());
        return rs;
    }

    private Room mapToRoom(RoomSaveDTO dto) {
        Room rs = new Room();
        rs.setRoomCode(dto.getRoomCode());
        rs.setRoomName(dto.getRoomName());
        rs.setNote(dto.getNote());
        return rs;
    }

    private SchoolYearDTO mapToSchoolYearDTO(SchoolYear schoolYear) {
        SchoolYearDTO rs = new SchoolYearDTO();
        rs.setId(schoolYear.getId());
        rs.setYear(schoolYear.getYear());
        rs.setNote(schoolYear.getNote());
        rs.setCreatedDate(schoolYear.getCreatedDate());
        rs.setUpdatedDate(schoolYear.getUpdatedDate());
        return rs;
    }

    private SchoolYear mapToSchoolYear(SchoolYearSaveDTO dto) {
        SchoolYear rs = new SchoolYear();
        rs.setYear(dto.getYear());
        rs.setNote(dto.getNote());
        return rs;
    }

    private TimeSlotDTO mapToTimeSlotDTO(TimeSlot timeSlot) {
        TimeSlotDTO rs = new TimeSlotDTO();
        rs.setId(timeSlot.getId());
        rs.setStartHour(timeSlot.getStartHour());
        rs.setEndHour(timeSlot.getEndHour());
        rs.setCreatedDate(timeSlot.getCreatedDate());
        rs.setUpdatedDate(timeSlot.getUpdatedDate());
        return rs;
    }

    private TimeSlot mapToTimeSlot(TimeSlotSaveDTO dto) {
        TimeSlot rs = new TimeSlot();
        rs.setId(dto.getId());
        rs.setStartHour(LocalTime.parse(dto.getStartTime()));
        rs.setEndHour(LocalTime.parse(dto.getEndTime()));
        return rs;
    }

    private YearCodeDTO mapToYearCodeDTO(YearCode yearCode) {
        YearCodeDTO rs = new YearCodeDTO();
        rs.setId(yearCode.getId());
        rs.setYearCode(yearCode.getYearCode());
        rs.setSemester(yearCode.getSemester());
        rs.setSchoolYear(yearCode.getSchoolYear());
        rs.setCreatedDate(yearCode.getCreatedDate());
        return rs;
    }
}
