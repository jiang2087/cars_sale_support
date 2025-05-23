package com.example.vinfast.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class DriverAssist {
    private int carId;
    private boolean hwyAssist;
    private boolean laneKeepAssist;
    private boolean trafficSignRec;
    private boolean driverMon;
    private boolean laneCentering;
    private boolean trafficJamAssist;
    private boolean cruise;
    private boolean adaptiveCruise;
    private boolean speedAdjust;
    private boolean frontCollWarn;
    private boolean frontAutoBrake;
    private boolean rearAutoBrake;
    private boolean intersectionWarn;
    private boolean autoLaneKeep;
    private boolean rearCrossWarn;
    private boolean blindSpotWarn;
}

