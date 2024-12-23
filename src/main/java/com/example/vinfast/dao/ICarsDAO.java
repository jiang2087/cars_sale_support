package com.example.vinfast.dao;

import com.example.vinfast.model.Car;

import java.util.List;

public interface ICarsDAO {
    List<Car> findAll();
    Car findById(int id);
    int save(Car car);
    List<Car> findSomeInfo();
    List<Car> findByCategory(int id);
    void updateCar(Car car);
    void deleteCar(int id);
}
