package com.example.vinfast.api.admin;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IBlogService;
import com.example.vinfast.util.HttpUtil;
import com.example.vinfast.util.UploadUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/api-blogs")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
        maxFileSize = 1024 * 1024 * 10,       // 10 MB
        maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class BlogApi extends HttpServlet {
    @Inject
    IBlogService blogService;

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if ("PATCH".equalsIgnoreCase(req.getMethod())) {
            doPatch(req, res);
        } else {
            super.service(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Blog blog = HttpUtil.of(req.getReader()).toModel(Blog.class);

        blogService.createBlog(blog);
        ApiResponse.<String>builder()
                .status("success")
                .data("Tạo bài viết mới thành công")
                .url("/admin/manage?action=blogs")
                .build();
        super.doPost(req, resp);
    }

    protected void doPatch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = null;
        if (req.getPart("file") != null) {
            fileName = UploadUtil.saveFileImage(req.getPart("file"), req, "/template/uploads/blogs");
        }
        Map<String, String> response = new HashMap<>();
        response.put("fileName", "blogs/" + fileName);
        new ObjectMapper().writeValue(resp.getOutputStream(), response);
    }
}
