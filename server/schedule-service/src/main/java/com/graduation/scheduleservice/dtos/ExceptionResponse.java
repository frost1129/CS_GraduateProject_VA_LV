package com.graduation.scheduleservice.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExceptionResponse {
    private int status;
    private String message;
    private Long timestamp;
}
