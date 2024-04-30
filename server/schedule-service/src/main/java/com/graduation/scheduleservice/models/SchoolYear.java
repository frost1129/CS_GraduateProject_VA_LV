package com.graduation.scheduleservice.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "school_year")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SchoolYear {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private int year;

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
