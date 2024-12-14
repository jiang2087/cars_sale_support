package com.example.vinfast.controller.admin;

import com.example.vinfast.model.Car;
import com.example.vinfast.service.ICarService;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin-cars")
public class ManageCarController extends HttpServlet {
    @Inject
    private ICarService carService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> cars = carService.getAllCars();
        req.setAttribute("cars", cars);
        RequestDispatcher rd = req.getRequestDispatcher("views/admin/manage-data/manage_car.jsp");
        rd.forward(req, resp);
    }
}
