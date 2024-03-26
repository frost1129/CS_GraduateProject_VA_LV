package com.graduation.authservice.controllers;

import com.graduation.authservice.dtos.SignInRequest;
import com.graduation.authservice.dtos.SignUpRequest;
import com.graduation.authservice.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;

@RestController
@RequestMapping("/api/v1/auth")
@CrossOrigin
public class AuthRestController {
    @Autowired
    private AuthService authService;

    @PostMapping("/signup")
    public ResponseEntity<?> signup(@RequestBody SignUpRequest signUpRequest) {
        authService.signup(signUpRequest);
        return ResponseEntity.ok(Collections.singletonMap("message", "Đăng ký tài khoản thành công!"));
    }

    @PostMapping("/signin")
    public ResponseEntity<?> signin(@RequestBody SignInRequest signInRequest) {
        return ResponseEntity.ok(authService.signin(signInRequest));
    }

    @PostMapping("/validate")
    public Boolean validateToken(@RequestParam("token") String token, @RequestParam("url") String url, @RequestParam("method") String method) {
        return authService.validateRequest(token, url, method);
    }

    @PostMapping("/getRole")
    public ResponseEntity<?> getRole(@RequestParam("token") String token) {
        return ResponseEntity.ok(authService.getRole(token));
    }
}
