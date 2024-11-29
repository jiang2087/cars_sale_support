package com.example.testjsp.service.impl;

import java.util.List;

import com.example.testjsp.dao.IDriverAssistDAO;
import com.example.testjsp.dao.impl.DriverAssistDAO;
import com.example.testjsp.model.DriverAssist;
import com.example.testjsp.service.IDriverAssistService;

public class DriverAssistService implements IDriverAssistService{

    private IDriverAssistDAO dao = new DriverAssistDAO();

    @Override
    public List<DriverAssist> findAll() {
        return dao.findAll();
    }

    @Override
    public DriverAssist findOne(int id) {
        return dao.findById(id);
    }

    @Override
    public void createExteriorFeatures(DriverAssist da) {
        dao.insertDA(da);
    }

    @Override
    public void updateDriverAssist(DriverAssist da) {
        dao.updateDA(da);
    }

    @Override
    public void deleteDriverAssist(int id) {
        dao.deleteDA(id);
    }

}