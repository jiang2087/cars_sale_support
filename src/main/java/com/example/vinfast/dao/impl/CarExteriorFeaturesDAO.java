package com.example.vinfast.dao.impl;

import java.util.List;

import com.example.vinfast.dao.ICarExteriorFeaturesDAO;
import com.example.vinfast.mapper.impl.CarExteriorFeaturesMapper;
import com.example.vinfast.model.CarExteriorFeatures;

public class CarExteriorFeaturesDAO extends AbstractDAO<CarExteriorFeatures> implements ICarExteriorFeaturesDAO{

    @Override
    public List<CarExteriorFeatures> findAll() {
        String query = """
					SELECT CarId, HeadlightType, DaytimeRunningLight, MirrorType,
					WiperFunction, Sunroof FROM Cars;
				""";
        return query(query, new CarExteriorFeaturesMapper());
    }

    @Override
    public CarExteriorFeatures findById(int id) {
        String query = """
				SELECT CarId, HeadlightType, DaytimeRunningLight, MirrorType,
				WiperFunction, Sunroof FROM Cars WHERE CarId=?;
			""";
        List<CarExteriorFeatures> list = query(query, new CarExteriorFeaturesMapper(), id);
        return list.isEmpty() ? null:list.getFirst();
    }

    @Override
    public void updateEF(CarExteriorFeatures ef) {
        String query = """
				 UPDATE Cars SET HeadlightType=?, DaytimeRunningLight=?,
				 MirrorType=?, WiperFunction=?, Sunroof=? WHERE CarId=?;
			""";
        update(query, ef.getHeadlightType(), ef.getDaytimeRunningLight(), ef.getMirrorType(), ef.getWiperFunction(), ef.getSunroof(), ef.getCarId());
    }
}