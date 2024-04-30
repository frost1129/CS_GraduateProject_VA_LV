package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.*;

import java.util.List;

public interface MasterSettingService {

    // ROOM
    List<RoomDTO> getAllRoom();
    RoomDTO getRoomById(Long roomId);
    List<RoomDTO> getRoomByCode(String roomCode);
    RoomDTO addOrUpdateRoom(Long roomId, RoomSaveDTO room);

    // SCHOOL YEAR
    List<SchoolYearDTO> getAllSchoolYear();
    SchoolYearDTO getSchoolYearById(Long yearId);
    SchoolYearDTO getSchoolYear(int schoolYear);
    SchoolYearDTO addOrUpdateSchoolYear(Long yearId, SchoolYearSaveDTO schoolYear);

    // TIME SLOT
    List<TimeSlotDTO> getAllTimeSlot();
    TimeSlotDTO getTimeSlotById(Long timeSlotId);
    TimeSlotDTO addOrUpdateTimeSlot(TimeSlotSaveDTO timeSlot);

    // YEAR CODE
    List<YearCodeDTO> getYearCodeByYear(int year);
    YearCodeDTO getYearCode(int yearCode);
}
