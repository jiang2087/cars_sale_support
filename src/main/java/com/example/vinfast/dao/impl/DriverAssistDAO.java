package com.example.vinfast.dao.impl;

import java.util.List;

import com.example.vinfast.dao.IDriverAssistDAO;
import com.example.vinfast.mapper.impl.DriverAssistMapper;
import com.example.vinfast.model.DriverAssist;

public class DriverAssistDAO extends AbstractDAO<DriverAssist> implements IDriverAssistDAO{

    @Override
    public List<DriverAssist> findAll() {
        String query = """
				SELECT CarId, HwyAssist, LaneKeepAssist, TrafficSignRec, DriverMon, LaneCentering, TrafficJamAssist, Cruise,
					AdaptiveCruise, SpeedAdjust, FrontCollWarn, FrontAutoBrake, RearAutoBrake, IntersectionWarn, AutoLaneKeep,
					RearCrossWarn, BlindSpotWarn FROM Cars;
				""";
        return query(query, new DriverAssistMapper());
    }

    @Override
    public DriverAssist findById(int id) {
        String query = """
				SELECT CarId, HwyAssist, LaneKeepAssist, TrafficSignRec, DriverMon, LaneCentering, TrafficJamAssist, Cruise,
					AdaptiveCruise, SpeedAdjust, FrontCollWarn, FrontAutoBrake, RearAutoBrake, IntersectionWarn, AutoLaneKeep,
					RearCrossWarn, BlindSpotWarn
					FROM Cars
					WHERE CarId=?;
				""";
        List<DriverAssist> list = query(query, new DriverAssistMapper(), id);
        return list.isEmpty() ? null : list.getFirst();
    }

    @Override
    public void updateDA(DriverAssist da) {
        String query = """
					UPDATE Cars SET HwyAssist=?, LaneKeepAssist=?, TrafficSignRec=?, DriverMon=?, LaneCentering=?, TrafficJamAssist=?, Cruise=?,
					AdaptiveCruise=?, SpeedAdjust=?, FrontCollWarn=?, FrontAutoBrake=?, RearAutoBrake=?, IntersectionWarn=?, AutoLaneKeep=?,
					RearCrossWarn=?, BlindSpotWarn=? WHERE CarId=?;
				""";
        update(query, da.isHwyAssist(), da.isLaneKeepAssist(), da.isTrafficSignRec(), da.isDriverMon(), da.isLaneCentering(),
                da.isTrafficJamAssist(), da.isCruise(), da.isAdaptiveCruise(), da.isSpeedAdjust(), da.isFrontCollWarn(), da.isFrontAutoBrake(),
                da.isRearAutoBrake() ,da.isIntersectionWarn(), da.isAutoLaneKeep(), da.isRearCrossWarn(), da.isBlindSpotWarn(), da.getCarId());

    }

}