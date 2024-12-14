package com.example.vinfast.service;

import java.util.List;

import com.example.vinfast.model.CarExteriorFeatures;

public interface ICarExteriorFeaturesService {

    List<CarExteriorFeatures> findAll() ;

    CarExteriorFeatures findOne(int id);

    void updateCarExteriorFeatures(CarExteriorFeatures ef);

}