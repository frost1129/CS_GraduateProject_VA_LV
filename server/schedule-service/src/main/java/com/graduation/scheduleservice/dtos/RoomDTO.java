package com.graduation.scheduleservice.dtos;

import lombok.Data;

@Data
public class RoomDTO {
    private Long id;
    private String roomCode;
    private String roomName;
    private Long createdDate;
    private Long updatedDate;
    private String note;
}
