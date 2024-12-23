package com.example.vinfast.service;

import com.example.vinfast.model.Province;
import com.example.vinfast.model.ShowRoom;
import com.example.vinfast.model.TestDriveRegistration;

import java.time.LocalDateTime;
import java.util.List;

public interface ITestDriveService {

    List<Province> getAllProvinces();

    List<ShowRoom> getShowRoomByProvinceId(String id);

    void createTestDriveRegistration(TestDriveRegistration tdr);

    List<TestDriveRegistration> getAllTestDriveRegistrations();

    void setUpTestDate(int testId, LocalDateTime time);

    TestDriveRegistration findById(int testId);

    void cancelTestDrive(int testId);
}
