package com.example.testjsp.test;

import com.example.testjsp.model.Users;
import com.example.testjsp.service.IUserService;
import com.example.testjsp.service.impl.UserService;
import com.example.testjsp.util.Argon2Util;

public class testMain {
    public static void main(String[] args) {
        IUserService userService = new UserService();

        userService.findAll().forEach(System.out::println);
    }
}
