package com.example.vinfast.controller.admin;

import com.example.vinfast.model.Blog;
import com.example.vinfast.model.Car;
import com.example.vinfast.model.TestDriveRegistration;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IBlogService;
import com.example.vinfast.service.ICarService;
import com.example.vinfast.service.ITestDriveService;
import com.example.vinfast.service.IUserService;
import com.example.vinfast.service.impl.CarService;
import com.example.vinfast.service.impl.TestDriveService;
import com.example.vinfast.service.impl.UserService;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/manage")
public class ManageDataController extends HttpServlet {
    @Inject
    IUserService userService;

    @Inject
    ICarService carService;

    @Inject
    ITestDriveService testDriveService;

    @Inject
    IBlogService blogService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = null;
        String action = req.getParameter("action");
        if (action.equals("users")) {

            List<Users> users = userService.findAll();
            req.setAttribute("users", users);
            String view = "/views/admin/manage-data/manage_user.jsp";
            rd = req.getRequestDispatcher(view);
        }else if(action.equals("cars")){

            List<Car> cars = carService.getAllCars();
            req.setAttribute("cars", cars);
            rd = req.getRequestDispatcher("/views/admin/manage-data/manage_car.jsp");
        }else if(action.equals("blogs")){

            List<Blog> blogs =  blogService.getBlogs();
            req.setAttribute("blogs", blogs);
            rd = req.getRequestDispatcher("/views/admin/manage-data/manage_blog.jsp");
        }else if(action.equals("test-drive")){

            List<TestDriveRegistration> tdrs = testDriveService.getAllTestDriveRegistrations();
            req.setAttribute("tdrs", tdrs);
            rd = req.getRequestDispatcher("/views/admin/manage-data/test-drive-schedule.jsp");
        }
        assert rd != null;
        rd.forward(req, resp);
    }
}
