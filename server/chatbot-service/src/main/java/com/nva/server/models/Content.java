package com.nva.server.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

@Entity
@Table(name = "contents")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Content {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "parent_content_id")
    private Content parentContent;

    @Column(nullable = false)
    private Integer contentLevel;

    @ManyToOne
    @JoinColumn(name = "school_year_id", nullable = false)
    private SchoolYear schoolYear;

    @ManyToOne
    @JoinColumn(name = "topic_id", nullable = false)
    private Topic topic;

    @Lob
    @Column(nullable = false)
    private String title;

    @Column(nullable = false, length = 10000)
    private String text;

    @CreatedDate
    @Column(nullable = false)
    private Long createdDate;

    @LastModifiedDate
    private Long lastModifiedDate;

    @Lob
    private String note;

    @PrePersist
    protected void onCreate() {
        this.createdDate = System.currentTimeMillis();
    }
}
