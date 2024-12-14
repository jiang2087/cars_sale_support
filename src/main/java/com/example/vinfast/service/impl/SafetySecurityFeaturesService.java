package com.example.vinfast.service.impl;

import com.example.vinfast.dao.ISafetySecurityFeaturesDAO;
import com.example.vinfast.model.SafetySecurityFeatures;
import com.example.vinfast.service.ISafetySecurityFeaturesService;
import jakarta.inject.Inject;

public class SafetySecurityFeaturesService implements ISafetySecurityFeaturesService {
    @Inject
    private ISafetySecurityFeaturesDAO dao;

    @Override
    public void updateSSF(SafetySecurityFeatures ssf) {
        dao.updateSafetySecurityFeatures(ssf);
    }

    @Override
    public SafetySecurityFeatures findOne(int carId) {
        return dao.findSafetySecurityFeaturesById(carId);
    }
}
