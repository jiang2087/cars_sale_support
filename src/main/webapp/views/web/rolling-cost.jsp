<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/12/2024
  Time: 1:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dự Toán Chi Phí Lăn Bánh</title>
</head>
<body>
<section id="main-rolling-cost">
    <div id="over-flay">
        <div class="container py-5">
            <div class="fs-3 fw-bold">Dự toán chi phí lăn bánh</div>
            <div class="row">
                <!-- Logo và Tiêu đề -->
                <div
                        class="col-lg-6 text-center d-flex flex-column justify-content-center align-items-center"
                >
                    <img
                            src="${pageContext.request.contextPath}/template/general/img/logo.png"
                            alt="VinFast Logo"
                            class="img-fluid mb-4"
                            style="max-width: 150px"
                    />
                </div>
                <!-- Form -->
                <div class="col-lg-6">
                    <form>
                        <ul class="nav nav-tabs mb-3">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Ô TÔ</a>
                            </li>
                        </ul>
                        <div class="mb-3">
                            <label for="car-model" class="form-label">Mẫu xe</label>
                            <select class="form-select" id="car-model" required>
                                <option selected disabled>Chọn mẫu xe</option>
                                <option>VF3</option>
                                <option>VF4</option>
                                <option>VF5</option>
                                <option>VF6</option>
                                <option>VF7</option>
                                <option>VF8</option>
                                <option>VF9</option>
                                <option>VF e34</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="version" class="form-label">Phiên bản</label>
                            <select id="version" class="form-select">
                                <option selected disabled>Chọn phiên bản</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="battery" class="form-label">Pin</label>
                            <select id="battery" class="form-select">
                                <option selected disabled>Chọn pin</option>
                                <option>Bao gồm pin</option>
                                <option>Không bao gồm pin</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="city" class="form-label">Tỉnh/ Thành phố</label>
                            <select id="city" class="form-select">
                                <option selected disabled>Chọn thành phố</option>
                                <option>Hà Nội</option>
                                <option>TP. Hồ Chí Minh</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="payment" class="form-label"
                            >Phương thức thanh toán</label
                            >
                            <select id="payment" class="form-select">
                                <option>Trả thẳng</option>
                                <option>Trả góp</option>
                            </select>
                        </div>
                        <div class="bg-light p-3 rounded">
                            <p class="mb-2">
                                Giá công bố: <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">Ưu đãi: <span class="float-end">0 đ</span></p>
                            <p class="mb-2">
                                Phí trước bạ: <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">
                                Phí bảo trì đường bộ (1 năm): <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">
                                Bảo hiểm trách nhiệm dân sự (1 năm):
                                <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">
                                Phí đăng ký biển số: <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">
                                Phí đăng kiểm: <span class="float-end">0 đ</span>
                            </p>
                            <p class="mb-2">Phí khác: <span class="float-end">0 đ</span></p>
                        </div>
                        <div class="mb-3 mt-4">
                            <div class="text-end fw-bold">
                                Chi phí lăn bánh dự kiến: <span>0 đ</span>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 py-2">
                            LIÊN HỆ
                        </button>
                        <p class="text-muted text-center mt-3 fs-6">
                            Bảng tính trên chỉ mang tính chất tham khảo. Quý khách vui lòng
                            liên hệ Showroom/ Nhà phân phối gần nhất để có báo giá chính xác
                            nhất.
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

