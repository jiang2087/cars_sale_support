package com.example.testjsp.dao;

import com.example.testjsp.model.Car;

import java.util.List;

public interface ICarsDAO {
    List<Car> findAll();
    Car findById(int id);
}
