package com.example.vinfast.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestDriveRegistration {
    private int registrationId;
    private String fullName;
    private String phoneNumber;
    private String email;
    private int carId;
    private int showroomId;
    private String additionalNotes;
    private Timestamp registrationDate;
    private String status;
    private LocalDate testDriveDate;
}
