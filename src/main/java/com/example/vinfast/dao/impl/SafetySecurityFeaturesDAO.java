package com.example.vinfast.dao.impl;

import com.example.vinfast.dao.ISafetySecurityFeaturesDAO;
import com.example.vinfast.mapper.impl.SafetySecurityFeaturesMapper;
import com.example.vinfast.model.SafetySecurityFeatures;

import java.util.List;

public class SafetySecurityFeaturesDAO  extends AbstractDAO<SafetySecurityFeatures> implements ISafetySecurityFeaturesDAO {
    @Override
    public List<SafetySecurityFeatures> findAllSafetySecurityFeatures() {
        return List.of();
    }

    @Override
    public void updateSafetySecurityFeatures(SafetySecurityFeatures safetySecurityFeatures) {
        String query =
                """
                UPDATE Cars SET ABSSystem = ?, EBDSystem = ?, BASystem = ?, ESCSystem = ?,
                TCSSystem = ?, HSASystem = ?, ROMSystem = ?, LASSupport = ?, AutoLockDoor = ?, AirbagSystem = ?,
                TPMSMonitoring = ?, SeatBeltTension = ?
                WHERE CarId = ?;
                """;
        update(query, safetySecurityFeatures.isAbsSystem(),
                safetySecurityFeatures.isEbdSystem(),
                safetySecurityFeatures.isBaSystem(),
                safetySecurityFeatures.isEscSystem(),
                safetySecurityFeatures.isTcsSystem(),
                safetySecurityFeatures.isHsaSystem(),
                safetySecurityFeatures.isRomSystem(),
                safetySecurityFeatures.isLasSupport(),
                safetySecurityFeatures.isAutoLockDoor(),
                safetySecurityFeatures.getAirbagSystem(),
                safetySecurityFeatures.getTpmsMonitoring(),
                safetySecurityFeatures.getCarId());
    }

    @Override
    public SafetySecurityFeatures findSafetySecurityFeaturesById(int id) {
        String query =
                """
                    SELECT CarId, AbsSystem, EbdSystem, BaSystem,
                    EscSystem, TcsSystem, HsaSystem, RomSystem, LasSupport, AutoLockDoor, AirbagSystem,
                    TpmsMonitoring, SeatBeltTension
                    FROM Cars
                    WHERE CarId = ?;
                    """;
        List<SafetySecurityFeatures> list = query(query, new SafetySecurityFeaturesMapper(), id);
        return list.isEmpty() ? null: list.getFirst();
    }
}