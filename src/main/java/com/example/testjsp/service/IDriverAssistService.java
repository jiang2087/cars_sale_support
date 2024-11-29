package com.example.testjsp.service;

import java.util.List;

import com.example.testjsp.model.DriverAssist;

public interface IDriverAssistService {

    List<DriverAssist> findAll() ;

    DriverAssist findOne(int id);

    void createExteriorFeatures(DriverAssist da);

    void updateDriverAssist(DriverAssist da);

    void deleteDriverAssist(int id);
}