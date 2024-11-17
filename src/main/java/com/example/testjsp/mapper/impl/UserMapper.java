package com.example.testjsp.mapper.impl;

import com.example.testjsp.mapper.IRowMappers;
import com.example.testjsp.model.Users;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class UserMapper implements IRowMappers<Users> {
    @Override
    public Users rowMapper(ResultSet rs) {
        Users user = new Users();
        try {
            user.setUserId(rs.getInt("UserID"));
            user.setFullName(rs.getString("FullName"));
            user.setEmail(rs.getString("Email"));
            user.setPassword(rs.getString("Password"));
            user.setPhoneNumber("PhoneNumber");
            user.setRole(rs.getString("Role"));
            user.setAddress(rs.getString("Address"));
            user.setAccountType(rs.getString("AccountType"));
            user.setStatus(rs.getString("Status"));
            user.setCreatedAt(rs.getTimestamp("CreatedAt").toLocalDateTime());
            user.setLastLogined(rs.getString("LastLogined"));
            user.setAvatar(rs.getString("avatar"));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }
}
