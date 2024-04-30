package com.graduation.scheduleservice.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDate;

@Entity
@Table(name = "subject_class_schedule")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubjectClassSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column
    private LocalDate startDate;

    @Column
    private int weeks;

    @Column
    private int weekday;

    @Column
    private int startTimeSlot;

    @Column
    private int endTimeSlot;

    @Column
    private Long teacherId;

    @OneToOne
    @JoinColumn(name = "subject_class_id")
    private SubjectClass subjectClass;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @LastModifiedDate
    private Long updatedDate;

    @PrePersist
    protected void onCreate() {
        this.createdDate = System.currentTimeMillis();
    }
}
