package com.example.testjsp.dao;

import java.util.List;

import com.example.testjsp.model.CarExteriorFeatures;

public interface ICarExteriorFeaturesDAO {
    List<CarExteriorFeatures> findAll();
    CarExteriorFeatures findById(int id);
    void insertEF(CarExteriorFeatures ef);
    void updateEF(CarExteriorFeatures ef);
    void deleteEF(int id);
}