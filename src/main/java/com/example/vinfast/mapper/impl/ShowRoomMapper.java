package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.SafetySecurityFeatures;
import com.example.vinfast.model.ShowRoom;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class ShowRoomMapper implements IRowMappers<ShowRoom> {
    private  static final Class<?> clazz = ShowRoom.class;
    @Override
    public ShowRoom rowMapper(ResultSet rs) {
        ShowRoom showRoom = new ShowRoom();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(showRoom, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return showRoom;
    }

    @Override
    public void setProperty(ShowRoom showroom, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(showroom, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}
