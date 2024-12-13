package com.example.vinfast.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CarExteriorFeatures {
    private int carId;
    private String headlightType;
    private String daytimeRunningLight;
    private String mirrorType;
    private String wiperFunction;
    private String sunroof;

    // Getters and setters
}

