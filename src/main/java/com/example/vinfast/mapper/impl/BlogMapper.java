package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.Blog;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class BlogMapper implements IRowMappers<Blog> {
    private static Class<?> clazz = Blog.class;

    @Override
    public Blog rowMapper(ResultSet rs) {
        Blog blog = new Blog();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                System.out.println(name);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(blog, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return blog;
    }

    @Override
    public void setProperty(Blog Blog, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(Blog, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }
}