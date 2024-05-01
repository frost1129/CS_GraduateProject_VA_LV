package com.graduation.scheduleservice.services;

import com.graduation.scheduleservice.dtos.PostResponse;
import com.graduation.scheduleservice.models.Post;

import java.util.Map;

public interface PostService {
    Post getPostByID(Long id);
    PostResponse getListPost(Map<String, String> params);
}
