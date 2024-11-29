package com.example.testjsp.service.impl;

import java.util.List;

import com.example.testjsp.dao.IInteriorFeaturesDAO;
import com.example.testjsp.dao.impl.InteriorFeaturesDAO;
import com.example.testjsp.model.InteriorFeatures;
import com.example.testjsp.service.IInteriorFeaturesService;

public class InteriorFeaturesService implements IInteriorFeaturesService{

    private IInteriorFeaturesDAO dao = new InteriorFeaturesDAO();

    @Override
    public List<InteriorFeatures> findAll() {
        return dao.findAll();
    }

    @Override
    public InteriorFeatures findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void createExteriorFeatures(InteriorFeatures da) {
        dao.insertIF(da);
    }

    @Override
    public void updateInteriorFeatures(InteriorFeatures da) {
        dao.updateIF(da);
    }

    @Override
    public void deleteInteriorFeatures(int id) {
        dao.deleteIF(id);
    }

}