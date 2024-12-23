package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ISaleDAO;

import java.util.List;

public class SaleDAO extends AbstractDAO<String> implements ISaleDAO {
    @Override
    public List<Integer> countByStatus(String status) {
        String query = """
                SELECT DATE(saleDate) AS sale_day, COUNT(*) AS product_count
                FROM Sales
                WHERE saleDate >= CURDATE() - INTERVAL 7 DAY AND Status = ?
                GROUP BY sale_day
                ORDER BY sale_day DESC;
                """;
        return countArray(query, status);
    }
}
