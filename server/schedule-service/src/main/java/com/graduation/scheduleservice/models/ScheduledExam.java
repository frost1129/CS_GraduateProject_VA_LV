package com.graduation.scheduleservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDate;

@Entity
@Table(name = "scheduled_exam")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScheduledExam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private LocalDate examDate;

    @Column(name = "length")
    private int lengthInMinute;

    @OneToOne
    @JoinColumn(name = "subject_class_id")
    private SubjectClass subjectClass;

    @ManyToOne()
    @JoinColumn(name = "time_slot")
    private TimeSlot timeSlot;

    @ManyToOne
    @JoinColumn(name = "room")
    private Room room;

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
