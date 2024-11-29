package com.example.testjsp.service;

import java.util.List;

import com.example.testjsp.model.InteriorFeatures;

public interface IInteriorFeaturesService {

    List<InteriorFeatures> findAll() ;

    InteriorFeatures findOne(int id);

    void createExteriorFeatures(InteriorFeatures da);

    void updateInteriorFeatures(InteriorFeatures da);

    void deleteInteriorFeatures(int id);
}