package com.example.testjsp.service;

import com.example.testjsp.model.Users;

import java.util.List;

public interface IUserService {
    void createAccount(Users user);

    Users validEmailAndPassword(String email, String password);

    boolean emailExisted(String email);

    void updateInformation(Users user);

    List<Users> findAll();

    Users finOne(int id);

    void deleteAccount(int id);
}
