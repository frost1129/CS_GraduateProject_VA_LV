package com.nva.server.services;

import com.nva.server.dtos.UserResponse;

import java.util.List;

public interface UserService {
    List<UserResponse> findAll();
}
