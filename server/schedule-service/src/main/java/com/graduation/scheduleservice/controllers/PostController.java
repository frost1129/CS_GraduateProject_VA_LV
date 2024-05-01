package com.graduation.scheduleservice.controllers;

import com.graduation.scheduleservice.dtos.PostResponse;
import com.graduation.scheduleservice.models.Post;
import com.graduation.scheduleservice.services.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/schedule-service/post")
@RequiredArgsConstructor
@CrossOrigin
public class PostController {

    private final PostService postService;

    @GetMapping
    public ResponseEntity<PostResponse> getListPost(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.postService.getListPost(params), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Post> getPostById(@PathVariable(name = "id") Long id) {
        return new ResponseEntity<>(this.postService.getPostByID(id), HttpStatus.OK);
    }
}
