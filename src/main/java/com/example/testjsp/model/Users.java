package com.example.testjsp.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private Integer userId;
    private String fullName;
    private String email;
    private String password;
    private String phoneNumber;
    private String address;
    private String role;
    private String accountType;
    private String status;
    private Timestamp createdAt;
    private String lastLogined;
    private String avatar;
}
