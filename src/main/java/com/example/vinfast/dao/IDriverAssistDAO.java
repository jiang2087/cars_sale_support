package com.example.vinfast.dao;

import java.util.List;

import com.example.vinfast.model.DriverAssist;

public interface IDriverAssistDAO {
    List<DriverAssist> findAll();
    DriverAssist findById(int id);
    void updateDA(DriverAssist da);
}
