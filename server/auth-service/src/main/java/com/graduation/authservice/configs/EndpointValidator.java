package com.graduation.authservice.configs;

import com.graduation.authservice.dtos.CommingRequest;
import com.graduation.authservice.dtos.RequestInfo;
import com.graduation.authservice.entities.Role;

import java.util.List;

public class EndpointValidator {
    private static final List<RequestInfo> requests = List.of(
            new RequestInfo("/api/v1/products", "GET", List.of(Role.ROLE_USER.name()))
    );
    public static boolean validateRequest(CommingRequest commingRequest) {
        return requests.stream().anyMatch(r ->
                r.getUri().equals(commingRequest.getUri()) &&
                r.getMethod().equalsIgnoreCase(commingRequest.getMethod()) &&
                r.getRoles().stream().anyMatch(role -> role.equals(commingRequest.getRole())));
    }

}
