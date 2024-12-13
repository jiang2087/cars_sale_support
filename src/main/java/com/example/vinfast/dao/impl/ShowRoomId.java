package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.IShowRoomDAO;
import com.example.vinfast.mapper.impl.ShowRoomMapper;
import com.example.vinfast.model.ShowRoom;

import java.util.List;

public class ShowRoomId extends AbstractDAO<ShowRoom> implements IShowRoomDAO {
    @Override
    public List<ShowRoom> getShowRoomsByProvinceId(int showroomId) {
        String query = """
                SELECT ShowroomId, Name, Address, ProvinceId, Phone, Email
                FROM ShowRoom
                WHERE ProvinceId = ?;
                """;
        return query(query, new ShowRoomMapper(), showroomId);
    }
}
