package com.example.vinfast.api.web;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IBlogService;
import com.example.vinfast.service.IUserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@WebServlet(urlPatterns = "/web/blog/details")
public class BlogAPI extends HttpServlet {
    @Inject
    IBlogService blogService;

    @Inject
    IUserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Blog blog = blogService.getBlogById(id);
        req.setAttribute("blog", blog);

        List<Comment> comments = blogService.getALlComments(id);
        AtomicInteger count = new AtomicInteger(comments.size());
        comments.forEach(comment -> {
            comment.setReply(blogService.getReply(id, comment.getCommentId()));
            count.addAndGet(comment.getReply().size());
        });
        req.setAttribute("comments", comments);
        req.setAttribute("totalComments", count.get());
        Users author = userService.finOne(blog.getAuthorId());
        req.setAttribute("author", author);
        RequestDispatcher rs = req.getRequestDispatcher("/views/web/detail-blog.jsp");
        rs.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        blogService.updateViews(id);

        ApiResponse<String> response = ApiResponse.<String>builder()
                .status("success")
                .build();

        new ObjectMapper().writeValue(resp.getWriter(), response);
    }
}
