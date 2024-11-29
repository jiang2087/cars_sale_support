package com.example.testjsp.dao;

import java.util.List;

import com.example.testjsp.model.DriverAssist;

public interface IDriverAssistDAO {
    List<DriverAssist> findAll();
    DriverAssist findById(int id);
    void insertDA(DriverAssist da);
    void updateDA(DriverAssist da);
    void deleteDA(int id);
}
