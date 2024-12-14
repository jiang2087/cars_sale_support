package com.example.vinfast.service.impl;

import com.example.vinfast.dao.ICarsDAO;
import com.example.vinfast.model.Car;
import com.example.vinfast.service.ICarService;
import jakarta.inject.Inject;

import java.util.List;

public class CarService implements ICarService {
    @Inject
    private ICarsDAO carDao;

    @Override
    public int createCar(Car car) {
        return carDao.save(car);
    }

    @Override
    public Car findOne(int id) {
        return carDao.findById(id);
    }

    @Override
    public List<Car> getInfoForTestDrive() {
        return carDao.findSomeInfo();
    }

    @Override
    public List<Car> getByCategory(int id) {
        return carDao.findByCategory(id);
    }

    @Override
    public List<Car> getAllCars() {
        return carDao.findAll();
    }
}
