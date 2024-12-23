package com.example.vinfast.dao;

import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;

import java.util.List;

public interface ICommentDAO {
    List<Comment> findAllByBlogId(int blogId);

    List<Comment> findAllByParentId(int blogId, int commentId);

    void createComment(Comment comment);
}
