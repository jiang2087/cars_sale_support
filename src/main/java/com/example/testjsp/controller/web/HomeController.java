package com.example.testjsp.controller.web;

import com.example.testjsp.model.Users;
import com.example.testjsp.service.IUserService;
import com.example.testjsp.util.Argon2Util;
import com.example.testjsp.util.FormUtil;
import com.example.testjsp.util.SessionUtil;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/web-home", "/login", "/logout", "/register"})
public class HomeController extends HttpServlet {
    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = null;
        String action = req.getParameter("action");
        if (action != null && action.equals("login")) {
            rd = req.getRequestDispatcher("views/general/login.jsp");
            rd.forward(req, resp);
        } else if (action != null && action.equals("register")) {
            rd = req.getRequestDispatcher("views/general/registration.jsp");
            rd.forward(req, resp);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(req, "INFUSER");
            SessionUtil.getInstance().removeValue(req, "INFACCOUNT");
            resp.sendRedirect(req.getContextPath() + "/web-home");
        } else {
            rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("login")) {
            Users userRequest = FormUtil.toModel(Users.class, req);
            Users user = userService.validEmailAndPassword(userRequest.getEmail(), userRequest.getPassword());
            if (user != null) {
                SessionUtil.getInstance().setValue(req, "INFUSER", user);
                String role = user.getRole();
                if (role != null && role.equalsIgnoreCase("user")) {
                    resp.sendRedirect(req.getContextPath() + "/web-home");
                } else if (role != null && role.equalsIgnoreCase("admin")) {
                    resp.sendRedirect(req.getContextPath() + "/admin-home");
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/login?action=login");
            }
        } else if (action != null && action.equals("register")) {
            Users user = FormUtil.toModel(Users.class, req);
            RequestDispatcher rd = req.getRequestDispatcher("views/general/registration.jsp");
            if(userService.emailExisted(user.getEmail())){
                req.setAttribute("status", "failed");
                rd.forward(req, resp);
//                resp.sendRedirect(req.getContextPath() + "/register?action=register&code=1");
            }else{
                userService.createAccount(user);
                req.setAttribute("status", "success");
                rd.forward(req, resp);
//                resp.sendRedirect(req.getContextPath() + "/login?action=login");
            }
        }
    }
}
