package com.example.testjsp.dao.impl;

import com.example.testjsp.dao.ICarsDAO;
import com.example.testjsp.mapper.impl.CarMapper;
import com.example.testjsp.model.Car;

import java.util.List;

public class CarDAO extends AbstractDAO<Car> implements ICarsDAO {
    @Override
    public List<Car> findAll() {
        String query = """
                SELECT CarID, ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge,
                       ChargingTime, MaxSpeed, Stock, WarrantyPeriod, Transmission, Seats,
                       SafetyFeatures, EntertainmentSystem, DriverAssistance, EnergyConsumption,
                       Dimensions, Weight, Torque, Horsepower, Drivetrain, Description, CreatedAt, UpdatedAt
                FROM Car;
                """;
        return query(query, new CarMapper());
    }

    @Override
    public Car findById(int id) {
        String query = """
                SELECT CarID, ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge,
                       ChargingTime, MaxSpeed, Stock, WarrantyPeriod, Transmission, Seats,
                       SafetyFeatures, EntertainmentSystem, DriverAssistance, EnergyConsumption,
                       Dimensions, Weight, Torque, Horsepower, Drivetrain, Description, CreatedAt, UpdatedAt
                FROM Car
                WHERE CarID = ?;
                """;
        List<Car> list = query(query, new CarMapper(), id);
        return list.isEmpty() ? null : list.getFirst();
    }
}
