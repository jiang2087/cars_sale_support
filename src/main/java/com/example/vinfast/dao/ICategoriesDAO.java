package com.example.vinfast.dao;


import com.example.vinfast.model.Categories;

import java.util.List;

public interface ICategoriesDAO {
    List<Categories> findAll();
}
