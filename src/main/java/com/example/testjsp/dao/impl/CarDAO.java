package com.example.testjsp.dao.impl;

import com.example.testjsp.dao.ICarsDAO;
import com.example.testjsp.mapper.impl.CarMapper;
import com.example.testjsp.model.Cars;

import java.util.List;

public class CarDAO extends AbstractDAO<Cars> implements ICarsDAO {
    @Override
    public List<Cars> findAll() {
        String query = """
                SELECT CarID, ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge,
                       ChargingTime, MaxSpeed, Stock, WarrantyPeriod, Transmission, Seats,
                       SafetyFeatures, EntertainmentSystem, DriverAssistance, EnergyConsumption,
                       Dimensions, Weight, Torque, Horsepower, Drivetrain, Description, CreatedAt, UpdatedAt
                FROM Cars;
                """;
        return query(query, new CarMapper());
    }

    @Override
    public Cars findById(int id) {
        String query = """
                SELECT CarID, ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge,
                       ChargingTime, MaxSpeed, Stock, WarrantyPeriod, Transmission, Seats,
                       SafetyFeatures, EntertainmentSystem, DriverAssistance, EnergyConsumption,
                       Dimensions, Weight, Torque, Horsepower, Drivetrain, Description, CreatedAt, UpdatedAt
                FROM Cars
                WHERE CarID = ?;
                """;
        List<Cars> list = query(query, new CarMapper(), id);
        return list.isEmpty() ? null : list.getFirst();
    }
}
