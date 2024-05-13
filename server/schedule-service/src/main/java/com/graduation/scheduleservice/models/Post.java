package com.graduation.scheduleservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "post")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @LastModifiedDate
    private Long updatedDate;

    @Column(name = "image", columnDefinition = "TEXT")
    private String image;

    @Transient
    private MultipartFile imageFile;

    @Column(name = "content", columnDefinition = "TEXT")
    private String content;

    @Column(name = "link", columnDefinition = "TEXT")
    private String link;
}
