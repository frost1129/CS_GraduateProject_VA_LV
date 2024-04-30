package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.*;
import com.graduation.scheduleservice.services.MasterSettingService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/schedule-service/master")
@RequiredArgsConstructor
@CrossOrigin
public class MasterSettingController {

    private final MasterSettingService masterSettingService;

    @GetMapping("/room")
    public ResponseEntity<List<RoomDTO>> getAllRoom() {
        return new ResponseEntity<>(masterSettingService.getAllRoom(), HttpStatus.OK);
    }

    @GetMapping("/room/by-id/{id}")
    public ResponseEntity<RoomDTO> getRoomById(@PathVariable(name = "id") Long id) {
        return new ResponseEntity<>(masterSettingService.getRoomById(id), HttpStatus.OK);
    }

    @GetMapping("/room/by-code/{code}")
    public ResponseEntity<List<RoomDTO>> getRoomByCode(@PathVariable(name = "code") String code) {
        return new ResponseEntity<>(masterSettingService.getRoomByCode(code), HttpStatus.OK);
    }

    @PostMapping("/room")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<RoomDTO> addRoom(@RequestBody RoomSaveDTO roomDTO) {
        return new ResponseEntity<>(masterSettingService.addOrUpdateRoom(null, roomDTO), HttpStatus.CREATED);
    }

    @PostMapping("/room/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<RoomDTO> updateRoom(@PathVariable(name = "id") Long id, @RequestBody RoomSaveDTO roomDTO) {
        return new ResponseEntity<>(masterSettingService.addOrUpdateRoom(id, roomDTO), HttpStatus.OK);
    }

    @GetMapping("/school-year")
    public ResponseEntity<List<SchoolYearDTO>> getAllSchoolYear() {
        return new ResponseEntity<>(masterSettingService.getAllSchoolYear(), HttpStatus.OK);
    }

    @GetMapping("/school-year/by-id/{id}")
    public ResponseEntity<SchoolYearDTO> getSchoolYearById(@PathVariable(name = "id") Long id) {
        return new ResponseEntity<>(masterSettingService.getSchoolYearById(id), HttpStatus.OK);
    }

    @GetMapping("/school-year/by-year/{year}")
    public ResponseEntity<SchoolYearDTO> getSchoolYear(@PathVariable(name = "year") int year) {
        return new ResponseEntity<>(masterSettingService.getSchoolYear(year), HttpStatus.OK);
    }

    @PostMapping("/school-year")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<SchoolYearDTO> addSchoolYear(@RequestBody SchoolYearSaveDTO yearDTO) {
        return new ResponseEntity<>(masterSettingService.addOrUpdateSchoolYear(null, yearDTO), HttpStatus.OK);
    }

    @PostMapping("/school-year/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<SchoolYearDTO> updateSchoolYear(@PathVariable(name = "id") Long id, @RequestBody SchoolYearSaveDTO yearDTO) {
        return new ResponseEntity<>(masterSettingService.addOrUpdateSchoolYear(id, yearDTO), HttpStatus.OK);
    }

    @GetMapping("/time-slot")
    public ResponseEntity<List<TimeSlotDTO>> getAllTimeSlot() {
        return new ResponseEntity<>(masterSettingService.getAllTimeSlot(), HttpStatus.OK);
    }

    @GetMapping("/time-slot/{id}")
    public ResponseEntity<TimeSlotDTO> getTimeSlotById(@PathVariable(name = "id") Long id) {
        return new ResponseEntity<>(masterSettingService.getTimeSlotById(id), HttpStatus.OK);
    }

    @PostMapping("/time-slot")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<TimeSlotDTO> addOrUpdateTimeSlot(@RequestBody TimeSlotSaveDTO timeSlotDTO) {
        return new ResponseEntity<>(masterSettingService.addOrUpdateTimeSlot(timeSlotDTO), HttpStatus.OK);
    }

    @GetMapping("/year-code/by-year/{year}")
    public ResponseEntity<List<YearCodeDTO>> getYearCodeByYear(@PathVariable(name = "year") int year) {
        return new ResponseEntity<>(masterSettingService.getYearCodeByYear(year), HttpStatus.OK);
    }

    @GetMapping("/year-code/by-code/{yearCode}")
    public ResponseEntity<YearCodeDTO> getYearCode(@PathVariable(name = "yearCode") int yearCode) {
        return new ResponseEntity<>(masterSettingService.getYearCode(yearCode), HttpStatus.OK);
    }
}
