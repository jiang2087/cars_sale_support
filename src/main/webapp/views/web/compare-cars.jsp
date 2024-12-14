<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 13/12/2024
  Time: 12:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>So sánh xe</title>
</head>
<body>
<section id="main-compare-car">
    <div id="over-flay">
        <!-- Tiêu đề -->
        <div class="align-center"><h1>So Sánh Xe</h1></div>
        <!-- Container chứa các ô chọn -->
        <div class="selection-container container">
            <div class="card">
                <div id="car-info">
                    <img src="" alt="" id="image-car"/>
                    <h5 id="model-name"></h5>
                    <p id="car-price"></p>
                </div>
                <div id="car-choose">
                    <div class="text-primary" style="font-size: 50px">+</div>
                    <p class="text-muted mb-0">Lựa chọn xe</p>
                </div>
            </div>
            <!-- Ô lựa chọn 2 -->
            <div class="card">
                <div id="car-info1">
                    <img src="" alt="" id="image-car1"/>
                    <h5 id="model-name1"></h5>
                    <p id="car-price1"></p>
                </div>
                <div id="car-choose1">
                    <div class="text-primary" style="font-size: 50px">+</div>
                    <p class="text-muted mb-0">Lựa chọn xe</p>
                </div>
            </div>
            <!-- Ô lựa chọn 1 -->
        </div>
        <div id="overlay"></div> <!-- Lớp nền tối -->

        <div id="myForm">
            <div class="modal-header">
                <div class="modal-title" id="carSelectModalLabel">
                    Chọn tối đa 1 phiên bản xe
                </div>
                <button
                        type="button"
                        class="btn-close"
                        id="closeBtn"
                ></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <input type="hidden" id='check_car' value="0">
                    <div class="col-md-6">
                        <h2>Xe điện</h2>
                        <c:forEach var="item" items="${electric}" varStatus="status">
                            <div class="form-section">
                                <div class="form-check">
                                    <input class="form-check-input single-check" type="checkbox" id="vf${status.index}" value="${item.carId}"/>
                                    <label class="form-check-label" for="vf${status.index}">${item.modelName}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="col-md-6">
                        <h2>Xe xăng</h2>
                        <div class="form-section">
                            <c:forEach var="item" items="${gasoline}" varStatus="status">
                                <div class="form-section">
                                    <div class="form-check">
                                        <input class="form-check-input single-check" type="checkbox" id="vf${status.index}" value="${item.carId}"/>
                                        <label class="form-check-label" for="vf${status.index}">${item.modelName}</label>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- Thêm các tùy chọn khác -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary">
                    Đóng
                </button>
                <button type="button" class="btn btn-primary" id="choose">Chọn xe</button>
            </div>
        </div>

        <div class="container my-4">
            <!-- Danh sách điều hướng -->
            <ul class="navigation">
                <li>
                    <a href="#section1" class="nav-item" data-bs-target="#collapse1"
                    >Kích thước</a
                    >
                </li>
                <li>
                    <a href="#section2" class="nav-item" data-bs-target="#collapse2"
                    >Động cơ & Vận hành</a
                    >
                </li>
                <li>
                    <a href="#section3" class="nav-item" data-bs-target="#collapse3"
                    >Ngoại thất</a
                    >
                </li>
                <li>
                    <a href="#section4" class="nav-item" data-bs-target="#collapse4"
                    >Nội thất</a
                    >
                </li>
                <li>
                    <a href="#section5" class="nav-item" data-bs-target="#collapse5"
                    >An ninh & An toàn</a
                    >
                </li>
                <li>
                    <a href="#section6" class="nav-item" data-bs-target="#collapse6"
                    >Hệ thống hỗ trợ lái xe ADAS</a
                    >
                </li>
            </ul>

            <div class="accordion" id="fullAccordion">
                <div class="accordion-item mb-3" id="section1">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse1"
                        >
                            Kích thước
                        </button>
                    </div>
                    <div id="collapse1" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">Dài x Rộng x Cao (mm)</td>
                                </tr>
                                <tr>
                                    <td id="Dimensions"></td>
                                    <td id="Dimensions1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Chiều dài cơ sở (mm)</td>
                                </tr>
                                <tr>
                                    <td id="WheelBase"></td>
                                    <td id="WheelBase1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section2">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse2"
                        >
                            Động cơ & Vận hành
                        </button>
                    </div>
                    <div id="collapse2" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        Công suất tối đa của động cơ (hp)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="MaxPower"></td>
                                    <td id="MaxPower1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Mô men xoắn cực đại (Nm/rpm)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Torque"></td>
                                    <td id="Torque1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Dẫn động</td>
                                </tr>
                                <tr>
                                    <td id="Drivetrain"></td>
                                    <td id="Drivetrain1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Loại hộp số</td>
                                </tr>
                                <tr>
                                    <td id="Transmission"></td>
                                    <td id="Transmission1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Thời gian bảo hành</td>
                                </tr>
                                <tr>
                                    <td id="WarrantyPeriod"></td>
                                    <td id="WarrantyPeriod1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Số lượng tồn kho</td>
                                </tr>
                                <tr>
                                    <td id="Stock"></td>
                                    <td id="Stock1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Quãng đường chạy một lần sạc đầy (km)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="RangePerCharge"></td>
                                    <td id="RangePerCharge1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section3">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse3"
                        >
                            Ngoại thất
                        </button>
                    </div>
                    <div id="collapse3" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">Đèn pha</td>
                                </tr>
                                <tr>
                                    <td id="HeadlightType"></td>
                                    <td id="HeadlightType1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Đèn chiếu sáng ban ngày
                                    </td>
                                </tr>
                                <tr>
                                    <td id="DaytimeRunningLight"></td>
                                    <td id="DaytimeRunningLight1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Gương chiếu hậu</td>
                                </tr>
                                <tr>
                                    <td id="MirrorType"> </td>
                                    <td id="MirrorType1"> </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Chức năng gạt mưa trước
                                    </td>
                                </tr>
                                <tr>
                                    <td id="WiperFunction"></td>
                                    <td id="WiperFunction1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Cửa sổ trời</td>
                                </tr>
                                <tr>
                                    <td id="Sunroof"></td>
                                    <td id="Sunroof1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section4">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse4"
                        >
                            Nội thất
                        </button>
                    </div>
                    <div id="collapse4" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">Số chỗ ngồi</td>
                                </tr>
                                <tr>
                                    <td id="SeatCount"></td>
                                    <td id="SeatCount1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Màn hình giải trí cảm ứng 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="TouchscreenSize"></td>
                                    <td id="TouchscreenSize1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Màn hình hiển thị HUD </td>
                                </tr>
                                <tr>
                                    <td id="HudDisplay"></td>
                                    <td id="HudDisplay1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Cấu hình ghế lái 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="DriverSeatConfig"></td>
                                    <td id="DriverSeatConfig1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Cấu hình ghế phụ </td>
                                </tr>
                                <tr>
                                    <td id="PassengerSeatConfig"></td>
                                    <td id="PassengerSeatConfig1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Điều chỉnh hướng vô lăng 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="SteeringWheelAdjustment"></td>
                                    <td id="SteeringWheelAdjustment1"></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Loại vô lăng 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="SteeringWheelType"> </td>
                                    <td id="SteeringWheelType1"> </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Hệ thống điều hòa 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="AirConditioningSystem"></td>
                                    <td id="AirConditioningSystem1"></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Cổng USB 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="UsbPorts"></td>
                                    <td id="UsbPorts1"></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Kết nối Bluetooth, Wi-Fi 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="BluetoothWifiConnectivity"></td>
                                    <td id="BluetoothWifiConnectivity1"></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Hệ thống âm thanh 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="SoundSystem"></td>
                                    <td id="SoundSystem1"></td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        Gói dịch vụ thông minh VinFast connect 
                                    </td>
                                </tr>
                                <tr>
                                    <td id="VinFastConnectService">Có</td>
                                    <td id="VinFastConnectService1">Có</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section5">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse5"
                        >
                            An ninh & An toàn
                        </button>
                    </div>
                    <div id="collapse5" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        Hệ thống chống bó cứng phanh (ABS)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="AbsSystem"></td>
                                    <td id="AbsSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng phân phối lực phanh điện tử (EBD)</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td id="EbdSystem"></td>
                                    <td id="EbdSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Chức năng hỗ trợ lực phanh khẩn cấp (BA)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="BaSystem"></td>
                                    <td id="BaSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Hệ thống cân bằng điện tử (ESC)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="EscSystem"></td>
                                    <td id="EscSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Chức năng kiểm soát lực kéo (TCS)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="TcsSystem"></td>
                                    <td id="TcsSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng hỗ trợ khởi hành ngang dốc (HSA)</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td id="HsaSystem"></td>
                                    <td id="HsaSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Chức năng chống lật (ROM)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="RomSystem"></td>
                                    <td id="RomSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Hỗ trợ giữ làn (LAS)</td>
                                </tr>
                                <tr>
                                    <td id="LasSuppor"></td>
                                    <td id="LasSuppor1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng tự động khóa cửa khi xe di chuyển</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td id="AutoLockDoor"></td>
                                    <td id="AutoLockDoor1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Hệ thống túi khí</td>
                                </tr>
                                <tr>
                                    <td id="AirbagSystem"></td>
                                    <td id="AirbagSystem1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Giám sát áp suất lốp</td>
                                </tr>
                                <tr>
                                    <td id="TpmsMonitoring"></td>
                                    <td id="TpmsMonitoring1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Căng đai khẩn cấp ghế trước và ghế hàng 2
                                    </td>
                                </tr>
                                <tr>
                                    <td id="SeatBeltTension"></td>
                                    <td id="SeatBeltTension1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section6">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse6"
                        >
                            Hệ thống hỗ trợ lái xe ADAS
                        </button>
                    </div>
                    <div id="collapse6" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        Hỗ trợ lái trên đường cao tốc (Level 2)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="HwyAssist"></td>
                                    <td id="HwyAssist1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Hỗ trợ giữ làn khẩn cấp
                                    </td>
                                </tr>
                                <tr>
                                    <td id="LaneKeepAssist"></td>
                                    <td id="LaneKeepAssist1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Nhận biết biển báo giao thông
                                    </td>
                                </tr>
                                <tr>
                                    <td id="TrafficSignRec"></td>
                                    <td id="TrafficSignRec1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Hệ thống giám sát lái xe
                                    </td>
                                </tr>
                                <tr>
                                    <td id="DriverMon"></td>
                                    <td id="DriverMon1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Kiểm soát đi giữa làn</td>
                                </tr>
                                <tr>
                                    <td id="LaneCentering"></td>
                                    <td id="LaneCentering1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Hỗ trợ di chuyển khi ùn tắc (Level 2)
                                    </td>
                                </tr>
                                <tr>
                                    <td id="TrafficJamAssist"></td>
                                    <td id="TrafficJamAssist1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Kiểm soát hành trình</td>
                                </tr>
                                <tr>
                                    <td id="Cruise"></td>
                                    <td id="Cruise1"></td>
                                </tr>
                                <tr>
                                    <td id="AdaptiveCruise"></td>
                                    <td id="AdaptiveCruise1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Điều chỉnh tốc độ thông minh
                                    </td>
                                </tr>
                                <tr>
                                    <td id="SpeedAdjust">Có</td>
                                    <td id="SpeedAdjust1">Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Cảnh báo va chạm phía trước
                                    </td>
                                </tr>
                                <tr>
                                    <td id="FrontCollWarn"></td>
                                    <td id="FrontCollWarn1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Phanh tự động khẩn cấp trước
                                    </td>
                                </tr>
                                <tr>
                                    <td id="FrontAutoBrake"></td>
                                    <td id="FrontAutoBrake1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Phanh tự động khẩn cấp sau
                                    </td>
                                </tr>
                                <tr>
                                    <td id="RearAutoBrake"></td>
                                    <td id="RearAutoBrake1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Cảnh báo va chạm khi ở giao lộ
                                    </td>
                                </tr>
                                <tr>
                                    <td id="IntersectionWarn"></td>
                                    <td id="IntersectionWarn1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Tự động giữ làn khẩn cấp
                                    </td>
                                </tr>
                                <tr>
                                    <td id="AutoLaneKeep"></td>
                                    <td id="AutoLaneKeep1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Cảnh báo phương tiện cắt ngang phía sau
                                    </td>
                                </tr>
                                <tr>
                                    <td id="RearCrossWarn"></td>
                                    <td id="RearCrossWarn1"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Cảnh báo điểm mù
                                    </td>
                                </tr>
                                <tr>
                                    <td id="BlindSpotWarn"></td>
                                    <td id="BlindSpotWarn1"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/template/web/assets/js/compare-car.js"></script>
</body>
</html>

