package com.example.vinfast.service;

import com.example.vinfast.model.Province;
import com.example.vinfast.model.ShowRoom;
import com.example.vinfast.model.TestDriveRegistration;

import java.util.List;

public interface ITestDriveService {

    List<Province> getAllProvinces();

    List<ShowRoom> getShowRoomByProvinceId(String id);

    void createTestDriveRegistration(TestDriveRegistration tdr);
}
