package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ICarsDAO;
import com.example.vinfast.mapper.impl.CarMapper;
import com.example.vinfast.model.Car;

import java.util.List;

public class CarDAO extends AbstractDAO<Car> implements ICarsDAO {
    @Override
    public List<Car> findAll() {
        String query = """
                SELECT CarId, ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge, ChargingTime, MaxPower,
                       MaxSpeed, Stock, WarrantyPeriod, Transmission, EnergyConsumption, Dimensions, WheelBase, Weight,
                       Torque, Drivetrain, Description, MainUrlImage, CreatedAt, UpdatedAt
                FROM Cars;
                """;
        return query(query, new CarMapper());
    }

    @Override
    public Car findById(int id) {
        String query = """
                SELECT CarId, ModelName, CategoryId, Price, BatteryCapacity, RangePerCharge, ChargingTime, MaxPower,
                       MaxSpeed, Stock, WarrantyPeriod, Transmission, EnergyConsumption, Dimensions, WheelBase, Weight,
                       Torque, Drivetrain, Description, MainUrlImage, CreatedAt, UpdatedAt
                FROM Cars
                WHERE CarId = ?;
                """;
        List<Car> list = query(query, new CarMapper(), id);
        return list.isEmpty() ? null : list.getFirst();
    }

    @Override
    public int save(Car car) {
        String query = """
                INSERT INTO Cars(ModelName, CategoryID, Price, BatteryCapacity, RangePerCharge, ChargingTime, MaxPower,
                       MaxSpeed, Stock, WarrantyPeriod, Transmission, EnergyConsumption, Dimensions, WheelBase, Weight,
                       Torque, Drivetrain, Description, MainUrlImage)
                VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
                """;
        return insert(query, car.getModelName(), car.getCategoryId(), car.getPrice(), car.getBatteryCapacity(),
                car.getRangePerCharge(), car.getChargingTime(), car.getMaxPower(), car.getMaxSpeed(), car.getStock(), car.getWarrantyPeriod(),
                car.getTransmission(), car.getEnergyConsumption(), car.getDimensions(), car.getWheelBase(), car.getWeight(),
                car.getTorque(), car.getDrivetrain(), car.getDescription(), car.getMainUrlImage());
    }

    @Override
    public List<Car> findSomeInfo() {
        String query = """
                SELECT CarId, ModelName, MainUrlImage, Price
                FROM Cars;
                """;
        return query(query, new CarMapper());
    }

    @Override
    public List<Car> findByCategory(int id) {
        String query = """
                SELECT CarId, ModelName
                FROM Cars
                WHERE CategoryId = ?;
                """;
        return query(query, new CarMapper(), id);
    }

    @Override
    public void updateCar(Car car) {
        String query = "UPDATE cars SET ModelName=?, CategoryID=?, Price=?, BatteryCapacity=?, RangePerCharge=?, ChargingTime=?, MaxPower=?," +
                "MaxSpeed=?, Stock=?, WarrantyPeriod=?, Transmission=?, EnergyConsumption=?, Dimensions=?, WheelBase=?, Weight=?," +
                "Torque=?, Drivetrain=?, Description=?, MainUrlImage=? WHERE CarId = ?";
        update(query,car.getModelName() ,car.getCategoryId(), car.getPrice(), car.getBatteryCapacity(), car.getRangePerCharge(), car.getChargingTime(),
                car.getMaxPower(), car.getMaxSpeed(), car.getStock(), car.getWarrantyPeriod(), car.getTransmission(), car.getEnergyConsumption(),
                car.getDimensions(), car.getWheelBase(), car.getWeight(), car.getTorque(),car.getDrivetrain() ,car.getDescription(), car.getMainUrlImage(), car.getCarId());
    }

    @Override
    public void deleteCar(int id) {
        String query = "DELETE FROM cars WHERE carId = ?";
        delete(query, id);
    }
}
