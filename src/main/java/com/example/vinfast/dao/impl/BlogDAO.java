package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.IBlogDAO;
import com.example.vinfast.mapper.impl.BlogMapper;
import com.example.vinfast.model.Blog;

import java.util.List;

public class BlogDAO extends  AbstractDAO<Blog> implements IBlogDAO {

    @Override
    public List<Blog> findAllBlogs() {
        String query = """
                SELECT b.BlogId AS BlogId, b.Title AS Title, b.Content AS Content, b.AuthorId AS AuthorId,
                b.CategoryId AS CategoryId, b.Slogan AS Slogan, b.Thumbnail AS Thumbnail, b.Tags AS Tags,
                b.Views AS Views, b.CreatedAt AS CreatedAt, b.UpdatedAt AS UpdatedAt, u.fullName AS fullName
                FROM Blogs b
                INNER JOIN Users u ON b.AuthorId = u.UserId
                ORDER BY b.CreatedAt DESC;
                """;
        return query(query, new BlogMapper());
    }

    @Override
    public void createBlog(Blog blog) {
        String query =
                """
                INSERT INTO Blogs (Title, Content, AuthorId, CategoryId, Thumbnail)
                VALUES(?, ?, ?, ?, ?, ?, ?)
                """;

        insert(
                query,
                blog.getTitle(),
                blog.getContent(),
                blog.getAuthorId(),
                blog.getCategoryId(),
                blog.getThumbnail()
        );
    }

    @Override
    public void updateBlog(Blog blog) {
        String query =
                """
                UPDATE Blogs SET Title = ?, Content = ?, AuthorID = ?, CategoryId = ?, Thumbnail = ?, Tags = ?, Views = ?
                WHERE blogId = ?;
                """;
        update(query, blog.getTitle(), blog.getContent(), blog.getAuthorId(), blog.getCategoryId(), blog.getThumbnail(), blog.getTags(), blog.getViews(), blog.getBlogId());
    }

    @Override
    public void deleteBlog(int id) {
        String query = "DELETE FROM Blogs WHERE blogId = ?;";
        delete(query, id);
    }

    @Override
    public Blog findById(int id) {
        String query =
                """
                SELECT b.BlogId AS BlogId, b.Title AS Title, b.Content AS Content, b.AuthorId AS AuthorId,
                        b.CategoryId AS CategoryId, b.Slogan AS Slogan, b.Thumbnail AS Thumbnail, b.Tags AS Tags,
                        b.Views AS Views, b.CreatedAt AS CreatedAt, b.UpdatedAt AS UpdatedAt, u.fullName AS fullName
                FROM Blogs b
                INNER JOIN Users u ON b.AuthorId = u.UserId
                WHERE BlogId = ?;
                """;
        List<Blog> list = query(query, new BlogMapper(), id);
        return list.isEmpty() ? null: list.getFirst();
    }

    @Override
    public void updateTrackView(int blogId) {
        String query = "UPDATE Blogs SET Views = Views + 1 WHERE BlogId = ?;";
        update(query, blogId);
    }

    @Override
    public List<Blog> findTopBLog() {
        String query = """
                SELECT b.Title AS Title, b.Views AS Views, b.Thumbnail AS Thumbnail, b.CreatedAt AS CreatedAt, COUNT(c.CommentId) AS Comments
                FROM Blogs b
                LEFT JOIN Comments c ON b.blogId = c.blogId
                GROUP BY b.Title, b.Views, b.Thumbnail, b.CreatedAt
                ORDER BY b.views DESC
                LIMIT 5;
                """;
        return query(query, new BlogMapper());
    }

    @Override
    public List<Blog> findNewBlog() {
        String query = """
                SELECT Title, , Thumbnail, Slogan
                FROM Blogs
                ORDER BY Created DESC
                LIMIT 5;
                """;
        return query(query, new BlogMapper());
    }


    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        dao.findTopBLog().forEach(System.out::println);
    }
}