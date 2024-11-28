package com.example.testjsp.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cars {
    private Integer carId;
    private String modelName;
    private Integer categoryId;
    private BigDecimal price;
    private BigDecimal batteryCapacity;
    private Integer rangePerCharge;
    private String chargingTime;
    private BigDecimal maxSpeed;
    private Integer stock;
    private Integer warrantyPeriod;
    private String transmission;
    private Integer seats;
    private String safetyFeatures;
    private String entertainmentSystem;
    private String driverAssistance;
    private BigDecimal energyConsumption;
    private String dimensions;
    private BigDecimal weight;
    private BigDecimal torque;
    private BigDecimal horsepower;
    private String drivetrain;
    private String description;
    private Timestamp createdAt;
    private Timestamp updatedAt;

}
