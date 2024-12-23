package com.example.vinfast.api.admin;

import com.example.vinfast.dto.ApiResponse;
import com.example.vinfast.model.*;
import com.example.vinfast.service.*;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/api-cars")
public class CarApi extends HttpServlet {

    @Inject private ICarService carService;
    @Inject private IDriverAssistService driverAssistService;
    @Inject private IInteriorFeaturesService iInteriorFeaturesService;
    @Inject private ICarExteriorFeaturesService carExteriorFeaturesService;
    @Inject private ISafetySecurityFeaturesService safetySecurityFeaturesService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        DriverAssist da = driverAssistService.findOne(id);
        Car car = carService.findOne(id);
        CarExteriorFeatures ef = carExteriorFeaturesService.findOne(id);
        InteriorFeatures inf = iInteriorFeaturesService.findOne(id);
        SafetySecurityFeatures ssf = safetySecurityFeaturesService.findOne(id);

        Map<String, Object> response = new HashMap<>();
        response.put("da", da);
        response.put("car", car);
        response.put("ef", ef);
        response.put("inf", inf);
        response.put("ssf", ssf);
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String requestBody = new BufferedReader(new InputStreamReader(req.getInputStream()))
                .lines()
                .collect(Collectors.joining("\n"));

        Car car = mapper.readValue(requestBody, Car.class);
        DriverAssist driverAssist = mapper.readValue(requestBody, DriverAssist.class);
        InteriorFeatures interiorFeatures = mapper.readValue(requestBody, InteriorFeatures.class);
        CarExteriorFeatures carExteriorFeatures = mapper.readValue(requestBody, CarExteriorFeatures.class);
        SafetySecurityFeatures safetySecurityFeatures = mapper.readValue(requestBody, SafetySecurityFeatures.class);
        int id = carService.createCar(car);
        driverAssist.setCarId(id);
        interiorFeatures.setCarId(id);
        carExteriorFeatures.setCarId(id);
        safetySecurityFeatures.setCarId(id);

        driverAssistService.updateDriverAssist(driverAssist);
        iInteriorFeaturesService.updateInteriorFeatures(interiorFeatures);
        carExteriorFeaturesService.updateCarExteriorFeatures(carExteriorFeatures);
        safetySecurityFeaturesService.updateSSF(safetySecurityFeatures);
        System.out.println("day la tao san pham");
        ApiResponse<String> response = ApiResponse.<String>builder()
                .status("success")
                .data("Thêm thông tin thành công")
                .build();

        mapper.writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        String requestBody = new BufferedReader(new InputStreamReader(req.getInputStream()))
                .lines()
                .collect(Collectors.joining("\n"));

        Car car = mapper.readValue(requestBody, Car.class);
        DriverAssist driverAssist = mapper.readValue(requestBody, DriverAssist.class);
        InteriorFeatures interiorFeatures = mapper.readValue(requestBody, InteriorFeatures.class);
        CarExteriorFeatures carExteriorFeatures = mapper.readValue(requestBody, CarExteriorFeatures.class);
        SafetySecurityFeatures safetySecurityFeatures = mapper.readValue(requestBody, SafetySecurityFeatures.class);

        int id = Integer.parseInt(req.getParameter("id"));
        driverAssist.setCarId(id);
        car.setCarId(id);
        interiorFeatures.setCarId(id);
        carExteriorFeatures.setCarId(id);
        safetySecurityFeatures.setCarId(id);

        carService.updateCar(car);
        driverAssistService.updateDriverAssist(driverAssist);
        iInteriorFeaturesService.updateInteriorFeatures(interiorFeatures);
        carExteriorFeaturesService.updateCarExteriorFeatures(carExteriorFeatures);
        safetySecurityFeaturesService.updateSSF(safetySecurityFeatures);
        ApiResponse<String> response = ApiResponse.<String>builder()
                .status("success")
                .data("Thêm thông tin thành công")
                .build();
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        carService.deleteCar(id);
        Map<String, String> m = new HashMap<>();
        m.put("message", "Xóa thành công");
        new ObjectMapper().writeValue(resp.getWriter(), m);
    }
}
