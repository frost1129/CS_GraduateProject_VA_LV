package com.nva.server.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.util.List;

@Entity
@Table(name = "contents")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Content {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String uuid;

    @ManyToOne
    @JoinColumn(name = "parent_content_id")
    private Content parentContent;

    @OneToMany(mappedBy = "parentContent", cascade = CascadeType.ALL)
    private List<Content> childContents;

    @Column(nullable = false)
    private Integer contentLevel;

    @ManyToOne
    @JoinColumn(name = "school_year_id")
    private SchoolYear schoolYear;

    @ManyToOne
    @JoinColumn(name = "topic_id", nullable = false)
    private Topic topic;

    @Column(nullable = false, unique = true, length = 30)
    private String intentCode;

    @Lob
    @Column(nullable = false)
    private String title;

    @Column(nullable = false, length = 10000)
    private String text;

    @Transient
    @JsonIgnore
    private String imageBase64;

    private String imageLink;

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
