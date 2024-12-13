package com.example.vinfast.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowRoom {
    private int showroomId;
    private int provinceId;
    private String name;
    private String address;
    private String phone;
    private String email;
}
