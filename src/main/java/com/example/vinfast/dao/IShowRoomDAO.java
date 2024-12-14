package com.example.vinfast.dao;

import com.example.vinfast.model.ShowRoom;

import java.util.List;

public interface IShowRoomDAO {
    List<ShowRoom> getShowRoomsByProvinceId(String id);
}
