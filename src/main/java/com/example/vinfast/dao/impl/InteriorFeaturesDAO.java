package com.example.vinfast.dao.impl;

import java.util.List;

import com.example.vinfast.dao.IInteriorFeaturesDAO;
import com.example.vinfast.mapper.impl.InteriorFeaturesMapper;
import com.example.vinfast.model.InteriorFeatures;

public class InteriorFeaturesDAO extends AbstractDAO<InteriorFeatures> implements IInteriorFeaturesDAO {

    @Override
    public List<InteriorFeatures> findAll() {
        String query = """
					SELECT Id, CarId, SeatCount, TouchscreenSize, HUDDisplay, DriverSeatConfig, PassengerSeatConfig, SteeringWheelAdjustment,
					SteeringWheelType, AirConditioningSystem, USBPorts, BluetoothWifiConnectivity, SoundSystem, VinFastConnectService
					FROM Cars;
				""";
        return query(query, new InteriorFeaturesMapper());
    }

    @Override
    public InteriorFeatures findById(int id) {
        String query = """
				SELECT CarId, SeatCount, TouchscreenSize, HUDDisplay, DriverSeatConfig, PassengerSeatConfig, SteeringWheelAdjustment,
				SteeringWheelType, AirConditioningSystem, USBPorts, BluetoothWifiConnectivity, SoundSystem, VinFastConnectService
				FROM Cars WHERE CarId=?;
			""";
        List<InteriorFeatures> list = query(query, new InteriorFeaturesMapper(), id);
        return list.isEmpty() ? null : list.getFirst();
    }

    @Override
    public void updateIF(InteriorFeatures inf) {
        String query = """
					UPDATE Cars SET SeatCount=?, TouchscreenSize=?, HUDDisplay=?, DriverSeatConfig=?,
					PassengerSeatConfig=?, SteeringWheelAdjustment=?, SteeringWheelType=?, AirConditioningSystem=?,
					USBPorts=?, BluetoothWifiConnectivity=?, SoundSystem=?, VinFastConnectService=?
					WHERE CarId=?;
				""";
        update(query, inf.getSeatCount(), inf.getTouchscreenSize(), inf.isHudDisplay(), inf.getDriverSeatConfig(),
                inf.getPassengerSeatConfig(), inf.getSteeringWheelAdjustment() ,inf.getSteeringWheelType(), inf.getAirConditioningSystem(),
                inf.getUsbPorts(), inf.isBluetoothWifiConnectivity(), inf.getSoundSystem(), inf.isVinFastConnectService(), inf.getCarId());
    }
}