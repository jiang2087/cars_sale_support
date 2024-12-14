package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.Order;
import com.example.vinfast.model.Province;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class ProvinceMapper implements IRowMappers<Province> {
    private static Class<?> clazz = Province.class;

    @Override
    public Province rowMapper(ResultSet rs) {
        Province province = new Province();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(province, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return province;
    }

    @Override
    public void setProperty(Province province, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(province, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

}
