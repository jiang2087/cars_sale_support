package com.example.vinfast.api.web;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.TestDriveRegistration;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.ITestDriveService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/test-drive")
public class TestDriveAPI extends HttpServlet {
    @Inject
    private ITestDriveService testDriveService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("provinceId");
        var showroms = testDriveService.getShowRoomByProvinceId(id);
        new ObjectMapper().writeValue(resp.getWriter(), showroms);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        TestDriveRegistration tdr = HttpUtil.of(req.getReader()).toModel(TestDriveRegistration.class);
        testDriveService.createTestDriveRegistration(tdr);
        ApiResponse<String> response = ApiResponse.<String>builder()
                .status("success")
                .url("/web-extensive?action=test-drive")
                .data("Đă gửi yêu cầu lái thử. Vui lòng chờ nhân viên xử lý!")
                .build();
        mapper.writeValue(resp.getWriter(), response);
    }
}
