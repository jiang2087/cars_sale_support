<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 27/11/2024
  Time: 10:56 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/mdb.min.css">
</head>
<body>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Chỉnh sửa dữ liệu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu về xe</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form action="" id="form-submit" method="get">
                            <div class="content-2-1 d-flex justify-content-between align-items-center mt-2">
                                <div class="title">
                                    Tên: Thông tin xe
                                </div>
                                <div class="icon">
                                    <button type="button" id="addBtn">Thêm bản ghi<i
                                            class="fa-solid fa-plus"></i></button>
                                </div>
                            </div>
                            <hr>
                            <div class="desc">Giao diện hỗ trợ các tính năng như tìm kiếm, sắp xếp, phân trang, và các
                                nút hành động như Chỉnh sửa, Xoá. Người quản trị có thể nhanh chóng quản lý dữ liệu sản
                                phẩm với các thao tác trực quan, đồng thời lọc và xuất dữ liệu khi cần thiết.
                            </div>
                            <div class="content-2-2 d-flex justify-content-between">
                                <div class="show d-flex align-items-center">
                                    Show
                                    <select name="limit" id="selectOp">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                    </select>
                                    entries
                                </div>
                                <div class="search-child">
                                    Search:
                                    <input type="search" name="keyword" id="search">
                                </div>
                            </div>
                            <table id="table-car">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Ảnh</th>
                                    <th>Tên xe</th>
                                    <th>Giá</th>
                                    <th>Dung lượng pin</th>
                                    <th>Tốc độ tối đa</th>
                                    <th>Công suất tối đa</th>
                                    <th>Thời gian bảo hành</th>
                                    <th>Kích thước xe</th>
                                    <th>Mô men xoắn</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${cars}">
                                    <tr>
                                        <td><input type="radio"></td>
                                        <td>
                                            <div class="image-car"><img
                                                    src="${pageContext.request.contextPath}/template/uploads/${item.mainUrlImage}"
                                                    alt="anh"></div>
                                        </td>
                                        <td>${item.modelName}</td>
                                        <td>${item.price}₫</td>
                                        <td>${item.batteryCapacity}(kWh)</td>
                                        <td>${item.maxSpeed}(km/h)</td>
                                        <td>${item.maxPower}(hp)</td>
                                        <td>${item.warrantyPeriod}(năm)</td>
                                        <td>${item.dimensions}̣(mm)</td>
                                        <td>${item.torque}(Nm/rpm)</td>
                                        <td>
                                            <ul class="action-list">
                                                <li>
                                                    <button type="button" class="editBtn btn btn-primary"
                                                            data-id="${item.carId}"><i
                                                            class="fa fa-pencil-alt"></i></button>
                                                </li>
                                                <li>
                                                    <button type="button" class="deleteBtn btn btn-danger"
                                                            data-id="${item.carId}"><i
                                                            class="fa fa-times"></i></button>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <div class="paging">
                            <ul id="pagination-demo" class="pagination-sm"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="overlay"></div> <!-- Lớp nền tối -->

    <div id="myForm">
        <div class="title">
            <h3>Nhập thông tin sản phẩm</h3>
            <button class="close-btn" id="closeFormBtn">X</button> <!-- Nút đóng -->
        </div>

        <form id="form-product">
            <div id="form-1">
                <input type="hidden" name="productId">
                <div class="row">
                    <div class="image-car">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/vf3/summer-yellow.png"
                             alt="anh-xe">
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="modelName" name="modelName"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="modelName">Tên xe</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="price" name="price"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="price">Giá xe</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="batteryCapacity" name="batteryCapacity"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="batteryCapacity">Dung luọng pin (kWh)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="rangePerCharge" name="rangePerCharge"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="rangePerCharge">Quãng đường đi được sau mỗi lần sạc</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="chargingTime" name="chargingTime"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="chargingTime">Thời gian sạc</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="maxPower" name="maxPower"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="maxPower">Công suất tối đa (hp)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="maxSpeed" name="maxSpeed"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="maxSpeed">Tốc độ tối đa</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="stock" name="stock"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="stock">Số lượng tồn kho</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="warrantyPeriod" name="warrantyPeriod"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="warrantyPeriod">Thời gian bảo hành (năm)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="transmission" name="transmission"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="transmission">Loại hộp số</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="energyConsumption" name="energyConsumption"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="energyConsumption">Mức tiêu thụ năng lượng
                                (kWh/100km)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="dimensions" name="dimensions"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="dimensions">Kích thước xe (dài x rộng x cao)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="wheelBase" name="wheelBase"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="wheelBase">Chiều dài cơ sở của xe (mm)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="weight" name="weight"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="weight">Trọng lượng xe (kg)</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="torque" name="torque"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="torque"> Mô-men xoắn (Nm/rpm)</label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="drivetrain" name="drivetrain"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="drivetrain">Hệ dẫn động</label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <select id="brandSelect">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                        </select>
                    </div>
                    <div>
                        <div data-mdb-input-init class="form-outline">
                                <textarea id="description" class="form-control" rows="3"
                                          placeholder="Message sent to the employer"></textarea>
                            <label class="form-label" for="description">Mô tả</label>
                        </div>
                    </div>
                    <div class="btn-form">
                        <button type="button" class="btn btn-primary" id="next-form-2">Tiếp theo</button>
                    </div>
                </div>
            </div>

            <div id="form-2">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="hwyAssist" class="form-label fw-bold">Hỗ trợ đường cao tốc</label>
                        <select id="hwyAssist" class="hwyAssist" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="laneKeepAssist" class="form-label fw-bold">Hỗ trợ giữ làn đường</label>
                        <select id="laneKeepAssist" class="laneKeepAssist" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="trafficSignRec" class="form-label fw-bold">Nhận diện biển báo giao thông</label>
                        <select id="trafficSignRec" class="trafficSignRec" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="driverMon" class="form-label fw-bold">Giám sát người lái xe</label>
                        <select id="driverMon" class="driverMon" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="laneCentering" class="form-label fw-bold">Hỗ trợ căn giữa làn đường</label>
                        <select id="laneCentering" class="laneCentering" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="trafficJamAssist" class="form-label fw-bold">Hỗ trợ tắc đường</label>
                        <select id="trafficJamAssist" class="trafficJamAssist" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="cruise" class="form-label fw-bold">Kiểm soát hành trình</label>
                        <select id="cruise" class="cruise" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="adaptiveCruise" class="form-label fw-bold">Kiểm soát hành trình thích ứng</label>
                        <select id="adaptiveCruise" class="adaptiveCruise" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="speedAdjust" class="form-label fw-bold">Điều chỉnh tốc độ</label>
                        <select id="speedAdjust" class="speedAdjust" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="frontCollWarn" class="form-label fw-bold">Cảnh báo va chạm phía trước</label>
                        <select id="frontCollWarn" class="frontCollWarn" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="frontAutoBrake" class="form-label fw-bold">Phanh tự động phía trước</label>
                        <select id="frontAutoBrake" class="frontAutoBrake" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="rearAutoBrake" class="form-label fw-bold">Phanh tự động phía sau</label>
                        <select id="rearAutoBrake" class="rearAutoBrake" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="intersectionWarn" class="form-label fw-bold">Cảnh báo va chạm tại giao lộ</label>
                        <select id="intersectionWarn" class="intersectionWarn" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="autoLaneKeep" class="form-label fw-bold">Tự động giữ làn đường</label>
                        <select id="autoLaneKeep" class="autoLaneKeep" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="rearCrossWarn" class="form-label fw-bold">Cảnh báo phương tiện cắt ngang phía
                            sau</label>
                        <select id="rearCrossWarn" class="rearCrossWarn" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="blindSpotWarn" class="form-label fw-bold">Cảnh báo điểm mù</label>
                        <select id="blindSpotWarn" class="blindSpotWarn" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="btn-form">
                        <button type="button" class="btn btn-danger" id="back-form-1">Quay lại</button>
                        <button type="button" class="btn btn-primary" id="next-form-3">Tiếp theo</button>
                    </div>
                </div>
            </div>

            <div id="form-3">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="seatCount" name="seatCount"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="seatCount">Số chỗ ngồi</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="touchscreenSize" name="touchscreenSize"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="touchscreenSize">Độ lớn màn hình</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="hudDisplay" name="hudDisplay"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="hudDisplay">Màn hình HUB</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="driverSeatConfig" name="driverSeatConfig"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="driverSeatConfig">Ghế khách hàng</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="steeringWheelAdjustment" name="steeringWheelAdjustment"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="steeringWheelAdjustment">Điều chỉnh vô lăng</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id=" steeringWheelType" name=" steeringWheelType"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for=" steeringWheelType">Loại vô năng</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="airConditioningSystem" name="airConditioningSystem"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="airConditioningSystem">Hệ thống điều hòa không khí</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="usbPorts" name="usbPorts"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="usbPorts">Số cổng USB</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="bluetoothWifiConnectivity" name="bluetoothWifiConnectivity"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="bluetoothWifiConnectivity">Kết nối bluetool và wifi</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="soundSystem" name="soundSystem"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="soundSystem">Hệ thống âm thanh</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="vinFastConnectService" name="vinFastConnectService"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="vinFastConnectService">Dịch vụ kết nối vinfast</label>
                        </div>
                    </div>
                    <div class="btn-form">
                        <button type="button" class="btn btn-danger" id="back-form-2">Quay lại</button>
                        <button type="button" class="btn btn-primary" id="next-form-4">Tiếp theo</button>
                    </div>
                </div>
            </div>

            <div id="form-4">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="headlightType" name="headlightType"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="headlightType">Đèn pha</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="daytimeRunningLight" name="daytimeRunningLight"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="daytimeRunningLight">Đèn chiếu sáng ban ngày</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="mirrorType" name="mirrorType"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="mirrorType">Kiểu gương chiếu hậu</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="wiperFunction" name="wiperFunction"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="wiperFunction">Chức năng gạt mưa trước</label>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="sunroof" name="sunroof"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="sunroof">Cửa sổ trời</label>
                        </div>
                    </div>
                    <div class="btn-form">
                        <button type="button" class="btn btn-danger" id="back-form-3">Quay lại</button>
                        <button type="button" class="btn btn-primary" id="next-form-5">Tiếp theo</button>
                    </div>
                </div>
            </div>

            <div id="form-5">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="absSystem" class="form-label fw-bold">Hệ thống chống bó cứng phanh (ABS)</label>
                        <select id="absSystem" class="absSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="ebdSystem" class="form-label fw-bold">Chức năng phân phối lực phanh điện tử
                            (EBD)</label>
                        <select id="ebdSystem" class="ebdSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="baSystem" class="form-label fw-bold">Chức năng hỗ trợ lực phanh khẩn cấp
                            (BA)</label>
                        <select id="baSystem" class="baSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="escSystem" class="form-label fw-bold">Hệ thống cân bằng điện tử (ESC)</label>
                        <select id="escSystem" class="escSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="tcsSystem" class="form-label fw-bold">Chức năng kiểm soát lực kéo (TCS)</label>
                        <select id="tcsSystem" class="tcsSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="hsaSystem" class="form-label fw-bold">Chức năng hỗ trợ khởi hành ngang dốc
                            (HSA)</label>
                        <select id="hsaSystem" class="hsaSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="romSystem" class="form-label fw-bold">Chức năng chống lật (ROM)</label>
                        <select id="romSystem" class="romSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="lasSupport" class="form-label fw-bold">Hỗ trợ giữ làn (LAS)</label>
                        <select id="lasSupport" class="lasSupport" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="autoLockDoor" class="form-label fw-bold">Chức năng tự động khóa cửa khi xe di
                            chuyển</label>
                        <select id="autoLockDoor" class="autoLockDoor" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="airbagSystem" class="form-label fw-bold">Hệ thống túi khí</label>
                        <select id="airbagSystem" class="airbagSystem" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <div data-mdb-input-init class="form-outline">
                            <input type="text" id="tpmsMonitoring" name="tpmsMonitoring"
                                   class="form-control form-control-lg"/>
                            <label class="form-label" for="tpmsMonitoring">Giám sát áp suất lốp</label>
                        </div>
                    </div>
                    <div class=col-12">
                        <label for="seatBeltTension" class="form-label fw-bold">Căng đai khẩn cấp ghế trước và ghế hàng
                            2</label>
                        <select id="seatBeltTension" class="seatBeltTension" data-live-search="true">
                            <option value="true"> Có</option>
                            <option value="false">Không</option>
                        </select>
                    </div>
                    <div class="btn-form">
                        <button type="button" class="btn btn-danger" id="back-form-4">Quay lại</button>
                        <button type="button" class="btn btn-success" id="confirmButton">Lưu</button>
                        <button type="button" class="btn btn-primary" id="cancelButton">Hủy Bỏ</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.14.5/sweetalert2.min.js"
        integrity="sha512-JCDnPKShC1tVU4pNu5mhCEt6KWmHf0XPojB0OILRMkr89Eq9BHeBP+54oUlsmj8R5oWqmJstG1QoY6HkkKeUAg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/mdb.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-car.js"></script>


</body>
</html>
