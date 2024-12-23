package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.Comment;
import com.example.vinfast.model.DriverAssist;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class CommentMapper implements IRowMappers<Comment> {
    private static Class<?> clazz = Comment.class;

    @Override
    public Comment rowMapper(ResultSet rs) {
        Comment da = new Comment();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(da, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return da;
    }

    @Override
    public void setProperty(Comment da, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(da, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}
