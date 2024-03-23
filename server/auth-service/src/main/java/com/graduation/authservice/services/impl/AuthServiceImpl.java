package com.graduation.authservice.services.impl;

import com.graduation.authservice.configs.EndpointValidator;
import com.graduation.authservice.dtos.CommingRequest;
import com.graduation.authservice.dtos.JwtAuthenticationResponse;
import com.graduation.authservice.dtos.SignInRequest;
import com.graduation.authservice.dtos.SignUpRequest;
import com.graduation.authservice.entities.Role;
import com.graduation.authservice.entities.User;
import com.graduation.authservice.exceptions.AuthException;
import com.graduation.authservice.repositories.UserRepository;
import com.graduation.authservice.services.AuthService;
import com.graduation.authservice.services.JwtService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Slf4j
public class AuthServiceImpl implements AuthService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtService jwtService;

    @Override
    public Boolean validateRequest(String token, String uri, String method) {
        try {
            jwtService.validateToken(token);

            CommingRequest commingRequest = CommingRequest.builder()
                    .uri(uri)
                    .method(method)
                    .role(jwtService.extractRole(token))
                    .build();
            return EndpointValidator.validateRequest(commingRequest);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public String getRole(String token) {
        return jwtService.extractRole(token);
    }

    @Override
    public void signup(SignUpRequest signUpRequest) {
        if (userRepository.findByEmail(signUpRequest.getEmail()).isEmpty()) {
            User user = User.builder()
                    .email(signUpRequest.getEmail())
                    .name(signUpRequest.getName())
                    .password(passwordEncoder.encode(signUpRequest.getPassword()))
                    .role(Role.ROLE_USER)
                    .build();
            userRepository.save(user);
        } else {
            throw new AuthException("Email is taken!");
        }
    }

    @Override
    public JwtAuthenticationResponse signin(SignInRequest signInRequest) {
        try {
            Optional<User> user = userRepository.findByEmail(signInRequest.getEmail());
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(signInRequest.getEmail(), signInRequest.getPassword()));
        } catch (AuthenticationException e) {
            throw new AuthException("Tài khoản hoặc mật khẩu không chính xác!");
        }

        User user = userRepository.findByEmail(signInRequest.getEmail()).orElseThrow(() -> new IllegalArgumentException("Invalid email or password!"));
        String token = jwtService.generateToken(user);

        JwtAuthenticationResponse jwtAuthenticationResponse = new JwtAuthenticationResponse();
        jwtAuthenticationResponse.setToken(token);
        jwtAuthenticationResponse.setRefreshToken(token);
        return jwtAuthenticationResponse;
    }
}
