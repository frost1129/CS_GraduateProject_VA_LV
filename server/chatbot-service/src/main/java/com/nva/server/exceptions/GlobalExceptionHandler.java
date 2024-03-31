package com.nva.server.exceptions;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nva.server.dtos.ExceptionResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Map;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler {
    private final ObjectMapper objectMapper;

    @ExceptionHandler(SaveDataException.class)
    public ResponseEntity<?> handleSaveDataException(SaveDataException ex) {
        ExceptionResponse exceptionResponse = new ExceptionResponse();
        exceptionResponse.setStatus(HttpStatus.BAD_REQUEST.value());
        exceptionResponse.setMessage(ex.getMessage());
        exceptionResponse.setTimestamp(System.currentTimeMillis());

        return new ResponseEntity<>(objectMapper.convertValue(exceptionResponse, Map.class), HttpStatus.BAD_REQUEST);
    }
}
