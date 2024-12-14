package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ITestDriveRegistrationDAO;
import com.example.vinfast.mapper.impl.TestDriveRegistrationMapper;
import com.example.vinfast.model.TestDriveRegistration;

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
                SELECT RegistrationId, FullName, PhoneNumber, Email, CarId, ShowroomID, AdditionalNotes, RegistrationDate
                Status, TestDriveDate
                FROM TestDriveRegistration
                """;
        return query(query, new TestDriveRegistrationMapper());
    }

    @Override
    public void confirmRegistration(TestDriveRegistration tdr) {
        StringBuilder query = new StringBuilder("UPDATE TestDriveRegistration SET status = ?");
        if(tdr.getTestDriveDate() != null){
            query.append(", TestDriveDate = ?");
            query.append(" WHERE RegistrationId = ?");
            update(String.valueOf(query), tdr.getStatus(), tdr.getTestDriveDate(), tdr.getRegistrationId());
        }else{
            query.append(" WHERE RegistrationId = ?");
            update(String.valueOf(query), tdr.getStatus(), tdr.getRegistrationId());
        }
    }


}
