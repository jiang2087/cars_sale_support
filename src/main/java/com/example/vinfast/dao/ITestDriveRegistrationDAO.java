package com.example.vinfast.dao;

import com.example.vinfast.model.TestDriveRegistration;

import java.util.List;

public interface ITestDriveRegistrationDAO {

    void save(TestDriveRegistration testDriveRegistration);

    List<TestDriveRegistration> findAll();

    void confirmRegistration(TestDriveRegistration testDriveRegistration);
}
