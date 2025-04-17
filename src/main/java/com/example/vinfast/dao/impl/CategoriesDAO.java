package com.example.vinfast.dao.impl;


import com.example.vinfast.dao.ICategoriesDAO;
import com.example.vinfast.mapper.impl.CategoriesMapper;
import com.example.vinfast.mapper.impl.ColorsMapper;
import com.example.vinfast.model.Categories;

import java.util.List;

public class CategoriesDAO extends AbstractDAO<ColorsMapper> implements ICategoriesDAO {
    @Override
    public List<Categories> findAll() {
        String query = "SELECT CategoryId, Name,Description, Status FROM categories";
        return query(query, new CategoriesMapper());
    }

    public static void main(String[] args) {
        CategoriesDAO dao = new CategoriesDAO();
        List<Categories> list = dao.findAll();
        System.out.println(list);
    }
}