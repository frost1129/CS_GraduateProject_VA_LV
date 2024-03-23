package com.graduation.authservice.services.impl;

import com.graduation.authservice.services.JwtService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
public class JwtServiceImpl implements JwtService {
//    public static final String SECRET_KEY = "5367586B59700373367639792F423F4528482B4D6251655128576D5A71347437";
    @Autowired
    private Environment env;

    @Override
    public void validateToken(String token) {
        Jwts.parser().setSigningKey(getSignInKey()).build().parseClaimsJws(token);
    }

    @Override
    public String generateToken(UserDetails userDetails) {
        return generateToken(new HashMap<>(), userDetails);
    }

    @Override
    public String generateToken(Map<String, Object> extraClaims, UserDetails userDetails) {
        Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
        String role = "";

        for (GrantedAuthority authority : authorities) {
            role = authority.getAuthority();
        }

        return Jwts.builder()
                .setClaims(extraClaims)
                .claim("role", role) // Adding roles to the claims
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 24))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }
    @Override
    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    @Override
    public String extractRole(String token) {
        try {
            Claims claims = Jwts.parser().setSigningKey(getSignInKey()).build().parseClaimsJws(token).getBody();
            return (String) claims.get("role");
        } catch (JwtException e) {
            // Handle invalid token exception
            throw new RuntimeException("Invalid token provided", e);
        }
    }

    private <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parser()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    private Key getSignInKey() {
        byte[] keyBytes = Decoders.BASE64.decode(env.getProperty("SECRET_KEY"));
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
