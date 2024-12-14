package com.example.vinfast.controller.web;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IUserService;
import com.example.vinfast.util.HttpUtil;
import com.example.vinfast.util.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

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
            resp.sendRedirect(req.getContextPath() + "/web-home");
        } else if(action != null && action.equals("detail")){
            rd = req.getRequestDispatcher("views/web/detail-car.jsp");
            rd.forward(req, resp);
        }else {
            rd = req.getRequestDispatcher("/views/web/home.jsp");
            rd.forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        if (action != null && action.equals("login")) {
            Users userRequest = HttpUtil.of(req.getReader()).toModel(Users.class);
            Users user = userService.validEmailAndPassword(userRequest.getEmail(), userRequest.getPassword());
            ApiResponse<String> response;
            if (user != null) {
                response = ApiResponse.<String>builder()
                        .status("success")
                        .data("Đăng nhập thành công!")
                        .build();

                SessionUtil.getInstance().setValue(req, "INFUSER", user);
                String role = user.getRole();
                if (role != null && role.equalsIgnoreCase("user")) {
                    response.setUrl("/web-home");
                } else if (role != null && role.equalsIgnoreCase("admin")) {
                    response.setUrl("/admin-home");
                }
            } else {
                response = ApiResponse.<String>builder()
                        .status("error")
                        .data("Email hoặc mật khẩu không hợp lệ. Vui lòng nhập lại")
                        .build();
            }
            new ObjectMapper().writeValue(resp.getWriter(), response);
        } else if (action != null && action.equals("register")) {
            Users user = HttpUtil.of(req.getReader()).toModel(Users.class);
            ApiResponse<String> response;
            if(userService.emailExisted(user.getEmail())){
                response = ApiResponse.<String>builder()
                        .status("error")
                        .data("Email hoặc mật khẩu không hợp lệ. Vui lòng nhập lại")
                        .build();
            }else{
                userService.createAccount(user);
                response = ApiResponse.<String>builder()
                        .status("success")
                        .data("Đăng nhập thành công!")
                        .build();
            }
            new ObjectMapper().writeValue(resp.getWriter(), response);
        }
    }
}
