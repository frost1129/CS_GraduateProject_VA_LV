package com.graduation.authservice.services;

import com.graduation.authservice.dtos.JwtAuthenticationResponse;
import com.graduation.authservice.dtos.SignInRequest;
import com.graduation.authservice.dtos.SignUpRequest;

public interface AuthService {
    Boolean validateRequest(String token, String uri, String method);
    String getRole(String token);
    void signup(SignUpRequest signUpRequest);
    JwtAuthenticationResponse signin(SignInRequest signInRequest);
}
