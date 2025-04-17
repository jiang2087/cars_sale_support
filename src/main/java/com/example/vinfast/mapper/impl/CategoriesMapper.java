package com.example.vinfast.mapper.impl;


import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.Categories;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class CategoriesMapper implements IRowMappers<Categories> {

    private static Class<?> clazz = Categories.class;

    @Override
    public Categories rowMapper(ResultSet rs) {
        Categories orderDetail = new Categories();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(orderDetail, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return orderDetail;
    }

    @Override
    public void setProperty(Categories orderDetail, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(orderDetail, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}