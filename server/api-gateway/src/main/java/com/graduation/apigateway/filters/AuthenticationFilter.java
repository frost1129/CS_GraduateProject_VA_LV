package com.graduation.apigateway.filters;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.graduation.apigateway.dtos.ErrorResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Objects;

@Component
public class AuthenticationFilter extends AbstractGatewayFilterFactory<AuthenticationFilter.Config> {
    @Autowired
    private RouteValidator routeValidator;
    @Autowired
    private WebClient.Builder webClientBuilder;
    @Autowired
    private ObjectMapper objectMapper;

    public AuthenticationFilter() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        return ((exchange, chain) -> {
            if (routeValidator.isSecured.test(exchange.getRequest())) {
                // CASE: Header doesn't contain token
                if (!exchange.getRequest().getHeaders().containsKey(HttpHeaders.AUTHORIZATION)) {
                    try {
                        return handleErrorResponse(exchange, new ErrorResponse("Missing header...", HttpStatus.UNAUTHORIZED.value(), System.currentTimeMillis()));
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                }

                String authHeader = Objects.requireNonNull(exchange.getRequest().getHeaders().get(HttpHeaders.AUTHORIZATION).get(0));
                if (authHeader.startsWith("Bearer "))
                    authHeader = authHeader.substring(7);

                String jwtToken = authHeader;
                return webClientBuilder.build().post()
                        .uri(uriBuilder -> uriBuilder
                                .scheme("http")
                                .host("auth-service")
                                .path("/api/v1/auth/validate")
                                .queryParam("token", jwtToken)
                                .queryParam("url", exchange.getRequest().getPath())
                                .queryParam("method", exchange.getRequest().getMethod())
                                .build())
                        .retrieve()
                        .bodyToMono(Boolean.class)
                        .flatMap(response -> {
                            if (!response) {
                                try {
                                    return handleErrorResponse(exchange, new ErrorResponse("Unauthorized...", HttpStatus.UNAUTHORIZED.value(), System.currentTimeMillis()));
                                } catch (JsonProcessingException e) {
                                    throw new RuntimeException(e);
                                }
                            }
                            return chain.filter(exchange);
                        })
                        .onErrorResume(ex -> {
                            try {
                                return handleErrorResponse(exchange, new ErrorResponse("Undefined error...", HttpStatus.BAD_GATEWAY.value(), System.currentTimeMillis()));
                            } catch (JsonProcessingException e) {
                                throw new RuntimeException(e);
                            }
                        });
            } else return chain.filter(exchange);
        });
    }

    public Mono<Void> handleErrorResponse(ServerWebExchange exchange, ErrorResponse errorResponse) throws JsonProcessingException {
        String jsonErrorResponse = objectMapper.writeValueAsString(errorResponse);

        // Set response headers and body
        exchange.getResponse().getHeaders().setContentType(MediaType.APPLICATION_JSON);
        exchange.getResponse().setStatusCode(HttpStatusCode.valueOf(errorResponse.getStatus()));

        return exchange.getResponse().writeWith(Mono.just(exchange.getResponse()
                .bufferFactory().wrap(jsonErrorResponse.getBytes())));
    }

    public static class Config {
    }
}
