package com.example.testjsp.service;

import java.util.List;

import com.example.testjsp.model.CarExteriorFeatures;

public interface ICarExteriorFeaturesService {

    List<CarExteriorFeatures> findAll() ;

    CarExteriorFeatures findOne(int id);

    void createExteriorFeatures(CarExteriorFeatures ef);

    void updateCarExteriorFeatures(CarExteriorFeatures ef);

    void deleteCarExteriorFeatures(int id);

}