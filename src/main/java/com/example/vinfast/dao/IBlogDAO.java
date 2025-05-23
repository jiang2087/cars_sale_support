package com.example.vinfast.dao;

import com.example.vinfast.model.Blog;

import java.util.List;

public interface IBlogDAO {

    List<Blog> findAllBlogs();

    void createBlog(Blog blog);

    void updateBlog(Blog blog);

    void deleteBlog(int id);

    Blog findById(int id);

    void updateTrackView(int blogId);

    List<Blog> findTopBLog();

    List<Blog> findNewBlog();
}