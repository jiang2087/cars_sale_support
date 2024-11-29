package com.example.testjsp.dao;

import java.util.List;

import com.example.testjsp.model.InteriorFeatures;

public interface IInteriorFeaturesDAO {
    List<InteriorFeatures> findAll();
    InteriorFeatures findById(int id);
    void insertIF(InteriorFeatures inf);
    void updateIF(InteriorFeatures inf);
    void deleteIF(int id);
}