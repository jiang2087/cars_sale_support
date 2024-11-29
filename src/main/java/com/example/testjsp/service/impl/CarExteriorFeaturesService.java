package com.example.testjsp.service.impl;

import java.util.List;

import com.example.testjsp.dao.ICarExteriorFeaturesDAO;
import com.example.testjsp.dao.impl.CarExteriorFeaturesDAO;
import com.example.testjsp.model.CarExteriorFeatures;
import com.example.testjsp.service.ICarExteriorFeaturesService;

public class CarExteriorFeaturesService implements ICarExteriorFeaturesService {

    private ICarExteriorFeaturesDAO dao = new CarExteriorFeaturesDAO();

    @Override
    public List<CarExteriorFeatures> findAll() {
        return dao.findAll();
    }

    @Override
    public CarExteriorFeatures findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void createExteriorFeatures(CarExteriorFeatures ef) {
        dao.insertEF(ef);
    }

    @Override
    public void updateCarExteriorFeatures(CarExteriorFeatures ef) {
        dao.updateEF(ef);
    }

    @Override
    public void deleteCarExteriorFeatures(int id) {
        dao.deleteEF(id);
    }

}