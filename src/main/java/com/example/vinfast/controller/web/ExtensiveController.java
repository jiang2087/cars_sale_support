package com.example.vinfast.controller.web;

import com.example.vinfast.dao.IProvinceDAO;
import com.example.vinfast.model.Car;
import com.example.vinfast.model.Province;
import com.example.vinfast.service.ICarService;
import com.example.vinfast.service.ITestDriveService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/web-extensive")
public class ExtensiveController extends HttpServlet {
    @Inject
    ICarService carService;

    @Inject
    ITestDriveService testDriveService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = null;
        String action = req.getParameter("action");
        if(action.equals("rolling-cost")) {
            List<Car> car = carService.getInfoForTestDrive();
            req.setAttribute("car", car);
            rd = req.getRequestDispatcher("/views/web/rolling-cost.jsp");
            rd = req.getRequestDispatcher("/views/web/rolling-cost.jsp");
        }else if(action.equals("test-drive")) {
            List<Car> cars = carService.getInfoForTestDrive();
            List<Province> province = testDriveService.getAllProvinces();

            req.setAttribute("cars", cars);
            req.setAttribute("provinces", province);

            rd = req.getRequestDispatcher("/views/web/test-drive.jsp");
        }else if(action.equals("blogs")){
            rd = req.getRequestDispatcher("/views/web/blogs.jsp");
        }else if(action.equals("compare-cars")){
            var gasoline = carService.getByCategory(2);
            var electric = carService.getByCategory(1);

            req.setAttribute("gasoline", gasoline);
            req.setAttribute("electric", electric);

            rd = req.getRequestDispatcher("/views/web/compare-cars.jsp");
        }else if(action.equals("installment-cost")){
            rd = req.getRequestDispatcher("/views/web/installment-cost.jsp");
        }else if(action.equals("book")){
            rd = req.getRequestDispatcher("/views/web/book.jsp");
        }
        rd.forward(req, resp);
    }
}
