package com.example.testjsp.mapper.impl;

import com.example.testjsp.mapper.IRowMappers;
import com.example.testjsp.model.Cars;
import com.example.testjsp.model.Users;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class CarMapper implements IRowMappers<Cars> {
    private static Class<?> clazz = Cars.class;
    
    @Override
    public Cars rowMapper(ResultSet rs) {
        Cars cars = new Cars();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for(int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name.replace(name.substring(0, 1), name.substring(0, 1).toLowerCase());
                setProperty(cars, name, rs.getString(name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cars;
    }

    @Override
    public void setProperty(Cars cars, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(cars, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}
