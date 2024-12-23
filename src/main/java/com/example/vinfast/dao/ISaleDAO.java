package com.example.vinfast.dao;

import java.util.List;

public interface ISaleDAO {

    List<Integer> countByStatus(String status);
}
