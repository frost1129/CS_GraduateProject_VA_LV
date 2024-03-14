package com.graduation.discoveryserver.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import java.util.Objects;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private Environment env;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf(AbstractHttpConfigurer::disable).authorizeHttpRequests(request -> {
            request.anyRequest().authenticated();
        }).httpBasic(Customizer.withDefaults());
        return httpSecurity.build();
    }

    @Bean
    public UserDetailsService eurekaUser() {
        UserDetails user = User.builder()
                .username(Objects.requireNonNull(env.getProperty("spring.security.user.name")))
                .password(this.passwordEncoder().encode(Objects.requireNonNull(env.getProperty("spring.security.user.password"))))
                .roles("ADMIN")
                .build();
        return new InMemoryUserDetailsManager(user);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
