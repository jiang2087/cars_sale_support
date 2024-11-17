package com.example.testjsp.controller.admin;


import com.example.testjsp.model.Users;
import com.example.testjsp.service.IUserService;
import com.example.testjsp.util.FormUtil;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-users", "/edit-user"})
public class BookController extends HttpServlet {

    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String view = null;
        String type = req.getParameter("type");
        String id = req.getParameter("userId");
        if(type.equals("list")){
            List<Users> list = userService.findAll();
            req.setAttribute("list", list);
            view = "views/admin/manage_user.jsp";
        }
        else if(type.equals("edit")){
            if(id != null ){
                Users user = userService.finOne(Integer.parseInt(id));
                req.setAttribute("user", user);
            }
            view = "views/admin/edit.jsp";
        }
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }
}
