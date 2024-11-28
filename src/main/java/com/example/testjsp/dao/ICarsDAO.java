package com.example.testjsp.dao;

import com.example.testjsp.model.Cars;

import java.util.List;

public interface ICarsDAO {
    List<Cars> findAll();
    Cars findById(int id);
}
