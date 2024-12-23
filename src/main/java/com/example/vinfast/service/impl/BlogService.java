package com.example.vinfast.service.impl;

import com.example.vinfast.dao.IBlogDAO;
import com.example.vinfast.dao.ICommentDAO;
import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;
import com.example.vinfast.service.IBlogService;
import jakarta.inject.Inject;

import java.util.List;

public class BlogService implements IBlogService {

    @Inject
    IBlogDAO blogDAO;

    @Inject
    ICommentDAO commentDAO;

    @Override
    public List<Blog> getBlogs() {
        return blogDAO.findAllBlogs();
    }

    @Override
    public Blog getBlogById(int id) {
        return blogDAO.findById(id);
    }

    @Override
    public List<Comment> getALlComments(int blogId) {
        return commentDAO.findAllByBlogId(blogId);
    }

    @Override
    public List<Comment> getReply(int blogId, int commentId) {
        return commentDAO.findAllByParentId(blogId, commentId);
    }

    @Override
    public void addComment(Comment comment) {
        commentDAO.createComment(comment);
    }

    @Override
    public void createBlog(Blog blog) {
        blogDAO.createBlog(blog);
    }

    @Override
    public void updateViews(int blogId) {
        blogDAO.updateTrackView(blogId);
    }

    @Override
    public List<Blog> getTopBLogs() {
        return blogDAO.findTopBLog();
    }

    @Override
    public List<Blog> getNewBlogs() {
        return blogDAO.findNewBlog();
    }
}
