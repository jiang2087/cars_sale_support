package com.example.vinfast.api.web;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Comment;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IBlogService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/api/comments")
public class CommentAPI extends HttpServlet {

    @Inject
    IBlogService blogService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Comment cmt = HttpUtil.of(req.getReader()).toModel(Comment.class);

        blogService.addComment(cmt);

        ApiResponse<String> response = ApiResponse.<String>builder()
                .status("success")
                .url("/web/blog/details?id=" + cmt.getBlogId())
                .data("Đã đăng bình luận với bài viết này")
                .build();
         mapper.writeValue(resp.getWriter(), response);
    }
}
