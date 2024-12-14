package com.example.vinfast.service;

import com.example.vinfast.model.SafetySecurityFeatures;

public interface ISafetySecurityFeaturesService {
    void updateSSF(SafetySecurityFeatures ssf);

    SafetySecurityFeatures findOne(int carId);
}
