package com.graduation.scheduleservice.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "subject")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private String subjectCode;

    @Column
    private String subjectName;

    @Column
    private float credits;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @LastModifiedDate
    private Long updatedDate;

    @Lob
    private String note;

    @PrePersist
    protected void onCreate() {
        this.createdDate = System.currentTimeMillis();
    }
}
