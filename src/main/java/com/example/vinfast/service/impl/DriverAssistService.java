package com.example.vinfast.service.impl;

import java.util.List;

import com.example.vinfast.dao.IDriverAssistDAO;
import com.example.vinfast.dao.impl.DriverAssistDAO;
import com.example.vinfast.model.DriverAssist;
import com.example.vinfast.service.IDriverAssistService;
import jakarta.inject.Inject;

public class DriverAssistService implements IDriverAssistService{

    @Inject
    private IDriverAssistDAO dao;

    @Override
    public List<DriverAssist> findAll() {
        return dao.findAll();
    }

    @Override
    public DriverAssist findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void updateDriverAssist(DriverAssist da) {
        dao.updateDA(da);
    }
}