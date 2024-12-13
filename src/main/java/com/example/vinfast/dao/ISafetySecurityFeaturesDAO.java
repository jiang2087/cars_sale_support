package com.example.vinfast.dao;

import com.example.vinfast.model.SafetySecurityFeatures;

import java.util.List;

public interface ISafetySecurityFeaturesDAO {
    List<SafetySecurityFeatures> findAllSafetySecurityFeatures();

    void updateSafetySecurityFeatures(SafetySecurityFeatures safetySecurityFeatures);

    SafetySecurityFeatures findSafetySecurityFeaturesById(int id);
}