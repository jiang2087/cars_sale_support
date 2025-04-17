package com.example.vinfast.service;

import com.example.vinfast.model.Categories;

import java.util.List;

public interface ICategoriesService {
    List<Categories> findAll();
}