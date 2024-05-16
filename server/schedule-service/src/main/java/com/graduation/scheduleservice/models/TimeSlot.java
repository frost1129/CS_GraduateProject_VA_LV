package com.graduation.scheduleservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalTime;
import java.util.Objects;

@Entity
@Table(name = "time_slot")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TimeSlot {
    @Id
    @Column
    private Long id;

    @Column
    private LocalTime startHour;

    @Column
    private LocalTime endHour;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @LastModifiedDate
    private Long updatedDate;

    @PrePersist
    protected void onCreate() {
        this.createdDate = System.currentTimeMillis();
    }

    public boolean isRightAfter(TimeSlot slot2) {
        return Objects.equals(this.id + 1L, slot2.getId());
//        return Objects.equals(this.id, slot2.getId() + 1L) || Objects.equals(this.id + 1L, slot2.getId());
    }
}
