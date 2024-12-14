package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.IProvinceDAO;
import com.example.vinfast.mapper.impl.ProvinceMapper;
import com.example.vinfast.model.Province;

import java.util.List;

public class ProvinceDAO extends AbstractDAO<ProvinceDAO> implements IProvinceDAO {
    @Override
    public List<Province> findAll() {
        String query = "SELECT ProvinceId, ProvinceName FROM Province";
        return query(query, new ProvinceMapper());
    }
}
