package com.example.vinfast.service;

import com.example.vinfast.model.Car;

import java.util.List;

public interface ICarService {

    int createCar(Car car);

    Car findOne(int id);

    List<Car> getInfoForTestDrive();

    List<Car> getByCategory(int id);

    List<Car> getAllCars();
}
