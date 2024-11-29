package com.example.testjsp.test;

import com.example.testjsp.service.IUserService;
import com.example.testjsp.service.impl.UserService;

public class testMain {
    public static void main(String[] args) {
        IUserService userService = new UserService();

        System.out.println(userService.validEmailAndPassword("vsung2608@gmail.com", "vsung2608"));
    }
}
