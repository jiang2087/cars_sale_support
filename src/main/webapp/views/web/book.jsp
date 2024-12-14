<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 14/12/2024
  Time: 10:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section id="main-book">
    <div id="over-flay">
        <div class="container mt-5">
            <h2 class="text-center mb-4">Đặt Lịch Dịch Vụ</h2>
            <form>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <h5>1. Thông tin khách hàng</h5>
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ tên *</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    placeholder="Nhập họ và tên"
                                    maxlength="80"
                                    required
                            />
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại *</label>
                            <input
                                    type="tel"
                                    class="form-control"
                                    id="phone"
                                    placeholder="Tối thiểu 10 chữ số"
                                    pattern="\d{10,}"
                                    required
                            />
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email *</label>
                            <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    placeholder="vidu@gmail.com"
                                    required
                            />
                        </div>
                    </div>

                    <div class="col-md-6">
                        <h5>2. Thông tin xe</h5>
                        <div class="mb-3">
                            <label for="model" class="form-label">Mẫu xe *</label>
                            <select id="model" class="form-select" required>
                                <option selected disabled>Lựa chọn</option>
                                <option value="1">Model A</option>
                                <option value="2">Model B</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="mileage" class="form-label">Số Km</label>
                            <input
                                    type="number"
                                    class="form-control"
                                    id="mileage"
                                    placeholder="Nhập số km trên phương tiện của quý khách"
                            />
                        </div>
                        <div class="mb-3">
                            <label for="plate" class="form-label">Biển số xe *</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="plate"
                                    placeholder="Nhập biển số xe"
                                    required
                            />
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <h5>3. Dịch vụ</h5>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="service1" />
                            <label class="form-check-label" for="service1">Bảo dưỡng</label>
                            <a href="#" class="ms-3">Thêm chi tiết</a>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="service2" />
                            <label class="form-check-label" for="service2"
                            >Sửa chữa chung</label
                            >
                            <a href="#" class="ms-3">Thêm chi tiết</a>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="checkbox" id="service3" />
                            <label class="form-check-label" for="service3">Đồng sơn</label>
                            <a href="#" class="ms-3">Thêm chi tiết</a>
                        </div>
                        <div class="mt-3">
                            <label for="note" class="form-label">Ghi chú</label>
                            <textarea
                                    class="form-control"
                                    id="note"
                                    rows="3"
                                    placeholder="Cụ thể yêu cầu Vinfast hỗ trợ"
                            ></textarea>
                        </div>
                        <div class="mt-3">
                            <label for="upload" class="form-label">Tải ảnh lên (0/5)</label>
                            <input type="file" class="form-control" id="upload" multiple />
                        </div>
                    </div>

                    <div class="col-md-6">
                        <h5>4. Địa điểm và Thời gian</h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <select id="location" class="form-select" required>
                                    <option selected disabled>Tỉnh thành</option>
                                    <option value="1">Hà Nội</option>
                                    <option value="2">TP. Hồ Chí Minh</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <select id="district" class="form-select" required>
                                    <option selected disabled>Quận/Huyện</option>
                                    <option value="1">Quận 1</option>
                                    <option value="2">Quận 2</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="serviceType"
                                    id="workshop"
                                    value="workshop"
                                    required
                            />
                            <label class="form-check-label" for="workshop"
                            >Xưởng dịch vụ</label
                            >
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="serviceType"
                                    id="mobileService"
                                    value="mobile"
                            />
                            <label class="form-check-label" for="mobileService"
                            >Dịch vụ sửa chữa lưu động</label
                            >
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="date" class="form-label">Ngày *</label>
                                <input type="date" class="form-control" id="date" required />
                            </div>
                            <div class="col-md-6">
                                <label for="time" class="form-label">Giờ *</label>
                                <input type="time" class="form-control" id="time" required />
                            </div>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Gửi yêu cầu</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>
