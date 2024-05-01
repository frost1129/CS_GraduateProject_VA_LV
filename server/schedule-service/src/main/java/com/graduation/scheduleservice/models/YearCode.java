package com.graduation.scheduleservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

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
