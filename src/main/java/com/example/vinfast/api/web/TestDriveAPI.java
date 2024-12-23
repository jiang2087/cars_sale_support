package com.example.vinfast.api.web;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.TestDriveRegistration;
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
import java.time.LocalDateTime;

@WebServlet(urlPatterns = "/api/test-drive")
public class TestDriveAPI extends HttpServlet {
    @Inject
    private ITestDriveService testDriveService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("provinceId");
        var showrooms = testDriveService.getShowRoomByProvinceId(id);
        new ObjectMapper().writeValue(resp.getWriter(), showrooms);
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

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        LocalDateTime date = LocalDateTime.parse(req.getParameter("time"));

        ApiResponse<String> response = ApiResponse.<String>builder().build();
        var test = testDriveService.findById(id);
        String check = test.getStatus();
        if(check.equals("Đã hủy") || check.equals("Hoàn thành")){
            response.setStatus("error");
            response.setData("Yêu cầu đã bị hủy hoặc đã hoàn thành trước đó. Không thể thiết lập thời gian lái thử");
        }else{
            testDriveService.setUpTestDate(id, date);
            response.setStatus("success");
            response.setData("Thiết lập thời gian lái thử cho " + test.getFullName());
        }
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        var test = testDriveService.findById(id);
        String check = test.getStatus();
        ApiResponse<String> response = ApiResponse.<String>builder().build();
        if(check.equals("Đã hủy") || check.equals("Hoàn thành")){
            response.setStatus("error");
            response.setData("Yêu cầu đã bị hủy hoặc đã hoàn thành trước đó. Không thể hủy yêu cầu nữa");
        }else{
            testDriveService.cancelTestDrive(id);
            response.setStatus("success");
            response.setData("Đã hủy yêu cầu lài thử của " + test.getFullName());
        }
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }
}
