package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ICommentDAO;
import com.example.vinfast.mapper.impl.CommentMapper;
import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;

import java.util.List;

public class CommentDAO extends AbstractDAO<Comment> implements ICommentDAO {
    @Override
    public List<Comment> findAllByBlogId(int blogId) {
        String query = """
                SELECT c.CommentId AS CommentId, c.UserId AS UserId, c.BlogId AS BlogId, c.ParentId AS ParentId,
                c.Content AS Content, c.CreateAt AS CreateAt, u.FullName AS FullName, u.Avatar AS Avatar
                FROM Comments c
                INNER JOIN Users u ON c.UserId = u.UserId
                WHERE BlogId = ? AND ParentId IS NULL
                ORDER BY c.CreateAt DESC;
                """;
        return query(query, new CommentMapper(), blogId);
    }

    @Override
    public List<Comment> findAllByParentId(int blogId, int commentId) {
        String query = """
                SELECT c.CommentId AS CommentId, c.UserId AS UserId, c.BlogId AS BlogId, c.ParentId AS ParentId,
                c.Content AS Content, c.CreateAt AS CreateAt, u.FullName AS FullName, u.Avatar AS Avatar
                FROM Comments c
                INNER JOIN Users u ON c.UserId = u.UserId
                WHERE BlogId = ? AND ParentId = ?
                ORDER BY c.CreateAt DESC;
                """;
        return query(query, new CommentMapper(), blogId, commentId);
    }

    @Override
    public void createComment(Comment comment) {
        String query = "INSERT INTO Comments(UserId, BLogId, Content) VALUES(?, ?, ?)";
        insert(query, comment.getUserId(), comment.getBlogId(), comment.getContent());
    }

    public static void main(String[] args) {
        CommentDAO dao = new CommentDAO();
        Comment cmt = Comment.builder()
                .userId(18)
                .blogId(1)
                .content("Tôi thấy chưa hợp lý lắm")
                .build();
        dao.createComment(cmt);
        dao.findAllByBlogId(1).forEach(System.out::println);
    }
}
