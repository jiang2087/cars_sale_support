package com.example.testjsp.service.impl;

import com.example.testjsp.dao.IUsersDAO;
import com.example.testjsp.dao.impl.UserDAO;
import com.example.testjsp.model.Users;
import com.example.testjsp.service.IUserService;
import com.example.testjsp.util.Argon2Util;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;

import java.util.List;

@Named
@ApplicationScoped
public class UserService implements IUserService {

    @Inject
    IUsersDAO usersDAO;

    @Override
    public void createAccount(Users user) {
        user.setPassword(Argon2Util.encyptPass(user.getPassword()));
        usersDAO.createAccount(user);
    }

    @Override
    public Users validEmailAndPassword(String email, String password) {
        Users user = usersDAO.findUserByEmail(email);
        if(user != null && Argon2Util.checkPass(password, user.getPassword())){
            return user;
        }
        return null;
    }

    @Override
    public boolean emailExisted(String email) {
        return usersDAO.checkAccountExistence(email) > 0;
    }

    @Override
    public void updateInformation(Users user) {
        usersDAO.updateAccount(user);
    }

    @Override
    public List<Users> findAll() {
        return usersDAO.findAllUsers();
    }

    @Override
    public Users finOne(int id) {
        return usersDAO.findById(id);
    }

    @Override
    public void deleteAccount(int id) {
        usersDAO.deleteUser(id);
    }
}
