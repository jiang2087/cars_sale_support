package com.example.vinfast.service.impl;

import com.example.vinfast.dao.ICategoriesDAO;
import com.example.vinfast.model.Categories;
import com.example.vinfast.service.ICategoriesService;
import jakarta.inject.Inject;

import java.util.List;

public class CategoriesService implements ICategoriesService {

    @Inject
    ICategoriesDAO dao;
    @Override
    public List<Categories> findAll() {
        return dao.findAll();
    }
}