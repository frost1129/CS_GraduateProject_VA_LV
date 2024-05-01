package com.graduation.scheduleservice.dtos;

import com.graduation.scheduleservice.models.Post;
import lombok.Data;

import java.util.List;

@Data
public class PostResponse {
    List<Post> data;
    private int currentPage;
    private int pageSize;
    private int totalPages;
}
