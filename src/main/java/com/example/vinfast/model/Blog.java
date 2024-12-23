package com.example.vinfast.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
    private int blogId;
    private String title;
    private String content;
    private int authorId;
    private String fullName;
    private int categoryId;
    private String thumbnail;
    private String slogan;
    private String tags;
    private int views;
    private long comments;
    private Date createdAt;
    private Timestamp updatedAt;
}

