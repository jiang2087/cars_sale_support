package com.example.vinfast.controller.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/web-extensive")
public class ExtensiveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = null;
        String action = req.getParameter("action");
        if(action.equals("rolling-cost")) {
            rd = req.getRequestDispatcher("/views/web/rolling-cost.jsp");
        }else if(action.equals("test-drive")) {
            rd = req.getRequestDispatcher("/views/web/test-drive.jsp");
        }else if(action.equals("blogs")){
            rd = req.getRequestDispatcher("/views/web/blogs.jsp");
        }else if(action.equals("compare-cars")){
            rd = req.getRequestDispatcher("/views/web/compare-cars.jsp");
        }else if(action.equals("installment-cost")){
            rd = req.getRequestDispatcher("/views/web/installment-cost.jsp");
        }
        rd.forward(req, resp);
    }
}
