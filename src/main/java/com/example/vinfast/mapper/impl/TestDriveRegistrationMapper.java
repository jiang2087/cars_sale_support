package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.ShowRoom;
import com.example.vinfast.model.TestDriveRegistration;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class TestDriveRegistrationMapper implements IRowMappers<TestDriveRegistration> {
    private  static final Class<?> clazz = ShowRoom.class;
    @Override
    public TestDriveRegistration rowMapper(ResultSet rs) {
        TestDriveRegistration tdr = new TestDriveRegistration();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(tdr, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return tdr;
    }

    @Override
    public void setProperty(TestDriveRegistration showroom, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(showroom, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}
