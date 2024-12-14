package com.example.vinfast.service.impl;

import java.util.List;

import com.example.vinfast.dao.IInteriorFeaturesDAO;
import com.example.vinfast.dao.impl.InteriorFeaturesDAO;
import com.example.vinfast.model.InteriorFeatures;
import com.example.vinfast.service.IInteriorFeaturesService;
import jakarta.inject.Inject;

public class InteriorFeaturesService implements IInteriorFeaturesService{

    @Inject
    private IInteriorFeaturesDAO dao;

    @Override
    public List<InteriorFeatures> findAll() {
        return dao.findAll();
    }

    @Override
    public InteriorFeatures findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void updateInteriorFeatures(InteriorFeatures da) {
        dao.updateIF(da);
    }

}