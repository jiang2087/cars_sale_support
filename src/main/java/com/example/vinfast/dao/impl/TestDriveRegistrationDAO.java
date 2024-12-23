package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ITestDriveRegistrationDAO;
import com.example.vinfast.mapper.impl.TestDriveRegistrationMapper;
import com.example.vinfast.model.TestDriveRegistration;

import java.time.LocalDateTime;
import java.util.List;

public class TestDriveRegistrationDAO extends AbstractDAO<TestDriveRegistration> implements ITestDriveRegistrationDAO {
    @Override
    public void save(TestDriveRegistration tdr) {
        String query = """
                INSERT INTO TestDriveRegistration(FullName, PhoneNumber, Email, CarId, ShowroomId, AdditionalNotes)
                       VALUES (?, ?, ?, ?, ?, ?)
                """;

        insert(query, tdr.getFullName(), tdr.getPhoneNumber(), tdr.getEmail(), tdr.getCarId(), tdr.getShowroomId(), tdr.getAdditionalNotes());
    }

    @Override
    public List<TestDriveRegistration> findAll() {
        String query = """
                  SELECT
                      r.RegistrationId AS RegistrationId,
                      r.FullName AS FullName,
                      r.PhoneNumber AS PhoneNumber,
                      r.Email AS Email,
                      r.CarId AS CarId,
                      c.ModelName AS ModelName,
                      r.ShowroomId AS ShowroomId,
                      s.Name AS Name,
                      s.Address AS Address,
                      r.AdditionalNotes AS AdditionalNotes,
                      r.RegistrationDate AS RegistrationDate,
                      r.Status AS Status,
                      r.TestDriveAt AS TestDriveAt
                  FROM TestDriveRegistration r
                  INNER JOIN Cars c ON r.CarId = c.CarId
                  INNER JOIN Showroom s ON r.ShowroomId = s.ShowroomId;
                  """;
        return query(query, new TestDriveRegistrationMapper());
    }

    @Override
    public void confirmRegistration(int testId, LocalDateTime time) {
        String query = """
                UPDATE TestDriveRegistration SET TestDriveAt = ?, Status = 'Chờ lái thử' WHERE RegistrationId = ?;
                """;
        update(query, time, testId);
    }

    @Override
    public TestDriveRegistration findById(int testId) {
        String query = """
                  SELECT
                      r.RegistrationId AS RegistrationId,
                      r.FullName AS FullName,
                      r.PhoneNumber AS PhoneNumber,
                      r.Email AS Email,
                      r.CarId AS CarId,
                      c.ModelName AS ModelName,
                      r.ShowroomId AS ShowroomId,
                      s.Name AS Name,
                      s.Address AS Address,
                      r.AdditionalNotes AS AdditionalNotes,
                      r.RegistrationDate AS RegistrationDate,
                      r.Status AS Status,
                      r.TestDriveAt AS TestDriveAt
                  FROM TestDriveRegistration r
                  INNER JOIN Cars c ON r.CarId = c.CarId
                  INNER JOIN Showroom s ON r.ShowroomId = s.ShowroomId
                  WHERE RegistrationId = ?;
                  """;
        List<TestDriveRegistration> result = query(query, new TestDriveRegistrationMapper(), testId);
        return result.isEmpty() ? null : result.getFirst();
    }

    @Override
    public void cancelTestDriveRegistration(int testId) {
        String query = "UPDATE TestDriveRegistration SET Status = 'Đã hủy' WHERE RegistrationId = ?;";
        update(query, testId);
    }
}
