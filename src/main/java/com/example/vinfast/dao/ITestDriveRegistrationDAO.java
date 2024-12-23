package com.example.vinfast.dao;

import com.example.vinfast.model.TestDriveRegistration;

import java.time.LocalDateTime;
import java.util.List;

public interface ITestDriveRegistrationDAO {

    void save(TestDriveRegistration testDriveRegistration);

    List<TestDriveRegistration> findAll();

    void confirmRegistration(int testId, LocalDateTime time);

    TestDriveRegistration findById(int testId);

    void cancelTestDriveRegistration(int testId);
}
