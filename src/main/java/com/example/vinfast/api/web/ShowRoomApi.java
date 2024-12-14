package com.example.vinfast.api.web;

import com.example.vinfast.service.impl.TestDriveService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/show-room")
public class ShowRoomApi extends HttpServlet {
    @Inject
    private TestDriveService testDriveService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("provinceId");

        var sr = testDriveService.getShowRoomByProvinceId(id);

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        new ObjectMapper().writeValue(resp.getWriter(), sr);
    }
}

