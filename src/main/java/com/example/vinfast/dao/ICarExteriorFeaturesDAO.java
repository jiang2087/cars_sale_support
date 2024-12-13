package com.example.vinfast.dao;

import java.util.List;

import com.example.vinfast.model.CarExteriorFeatures;

public interface ICarExteriorFeaturesDAO {
    List<CarExteriorFeatures> findAll();
    CarExteriorFeatures findById(int id);
    void updateEF(CarExteriorFeatures ef);
}