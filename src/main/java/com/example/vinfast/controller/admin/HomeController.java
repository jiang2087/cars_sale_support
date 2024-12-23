package com.example.vinfast.controller.admin;

import com.example.vinfast.model.Blog;
import com.example.vinfast.service.IBlogService;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin-home")
public class HomeController extends HttpServlet {

    @Inject
    IBlogService blogService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Blog> topBlogs = blogService.getTopBLogs();
        req.setAttribute("topBlogs", topBlogs);

        List<Blog> newBlogs = blogService.getTopBLogs();
        req.setAttribute("newBlogs", newBlogs);

        RequestDispatcher rd = req.getRequestDispatcher("views/admin/home.jsp");
        rd.forward(req, resp);
    }
}
