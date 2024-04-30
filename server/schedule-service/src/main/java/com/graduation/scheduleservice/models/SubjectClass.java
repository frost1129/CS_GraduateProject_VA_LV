package com.graduation.scheduleservice.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "subject_class")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubjectClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "subject")
    private Subject subject;

    @ManyToOne
    @JoinColumn(name = "year_code")
    private YearCode yearCode;

    @OneToOne(mappedBy = "subjectClass", cascade = CascadeType.ALL)
    @JsonIgnore
    private ScheduledExam scheduledExam;

    @OneToOne(mappedBy = "subjectClass", cascade = CascadeType.ALL)
    @JsonIgnore
    private SubjectClassSchedule subjectClassSchedule;

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
