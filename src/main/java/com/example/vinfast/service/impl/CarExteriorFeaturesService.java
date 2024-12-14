package com.example.vinfast.service.impl;

import java.util.List;

import com.example.vinfast.dao.ICarExteriorFeaturesDAO;
import com.example.vinfast.dao.impl.CarExteriorFeaturesDAO;
import com.example.vinfast.model.CarExteriorFeatures;
import com.example.vinfast.service.ICarExteriorFeaturesService;
import jakarta.inject.Inject;

public class CarExteriorFeaturesService implements ICarExteriorFeaturesService {

    @Inject
    private ICarExteriorFeaturesDAO dao;

    @Override
    public List<CarExteriorFeatures> findAll() {
        return dao.findAll();
    }

    @Override
    public CarExteriorFeatures findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void updateCarExteriorFeatures(CarExteriorFeatures ef) {
        dao.updateEF(ef);
    }
}