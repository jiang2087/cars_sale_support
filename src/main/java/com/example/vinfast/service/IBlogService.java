package com.example.vinfast.service;

import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;

import java.util.List;

public interface IBlogService {
    List<Blog> getBlogs();

    Blog getBlogById(int id);

    List<Comment> getALlComments(int blogId);

    List<Comment> getReply(int blogId, int commentId);

    void addComment(Comment comment);

    void createBlog(Blog blog);

    void updateViews(int blogId);

    List<Blog> getTopBLogs();

    List<Blog> getNewBlogs();
}
