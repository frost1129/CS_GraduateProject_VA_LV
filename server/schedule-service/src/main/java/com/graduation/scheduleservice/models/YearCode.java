package com.graduation.scheduleservice.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "year_code")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class YearCode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private int yearCode;

    @Column(nullable = false)
    private int semester;

    @ManyToOne
    @JoinColumn(name = "school_year")
    private SchoolYear schoolYear;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @PrePersist
    protected void onCreate() {
        this.createdDate = System.currentTimeMillis();
        this.yearCode = calcYearCode();
    }

    public int calcYearCode() {
        int yearIndent = this.schoolYear.getYear() % 100;
        return yearIndent * 10 + this.semester;
    }
}
