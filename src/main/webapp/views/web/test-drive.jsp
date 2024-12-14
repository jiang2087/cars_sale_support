<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Đăng Ký Lái Thử</title>

</head>
<body>
<section id="main-test-drive">
    <div id="over-flay" class="bg-light">
        <div
                class="container-fluid d-flex align-items-center justify-content-center bg-light"
        >
            <div class="row w-100">
                <!-- Logo VinFast -->
                <div
                        class="col-lg-6 d-flex flex-column align-items-center justify-content-center"
                >
                    <img
                            src="${pageContext.request.contextPath}/template/general/img/logo-xl.png"
                            alt="VinFast Logo"
                            class="mb-3"
                            style="max-width: 100%"
                            id="image-car"
                    />
                </div>
                <!-- Form Đăng Ký -->
                <div class="col-lg-6 bg-white p-4 shadow rounded">
                    <div class="text-center mb-3">ĐĂNG KÝ LÁI THỬ</div>
                    <p class="text-center mb-4">
                        Để đăng ký lái thử, Quý khách cần cung cấp giấy phép lái xe cho
                        VinFast
                    </p>
                    <!-- Tabs -->
                    <ul class="nav nav-tabs justify-content-center mb-4" role="tablist">
                        <li class="nav-item">
                            <button
                                    class="nav-link active"
                                    data-bs-toggle="tab"
                                    data-bs-target="#xe-oto"
                                    type="button"
                                    role="tab"
                            >
                                Xe ôtô
                            </button>
                        </li>
                    </ul>
                    <!-- Form Content -->
                    <form id="form-registration">
                        <div class="mb-3">
                            <label for="name" class="form-label">Họ và tên Quý khách *</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    placeholder="Họ và tên"
                                    required
                                    name="fullName"
                            />
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="phone" class="form-label">Số điện thoại *</label>
                                <input
                                        type="tel"
                                        class="form-control"
                                        id="phone"
                                        placeholder="Số điện thoại"
                                        required
                                        name="phoneNumber"
                                />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label">Email *</label>
                                <input
                                        type="email"
                                        class="form-control"
                                        id="email"
                                        placeholder="Email"
                                        required
                                        name="email"
                                />
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="car-model" class="form-label">Mẫu xe *</label>
                            <select class="form-select" id="car-model" name="carId" required>
                                <option selected disabled>Chọn mẫu xe</option>
                                <c:forEach var="item" items="${cars}">
                                    <option value="${item.carId}" data-image="${item.mainUrlImage}">${item.modelName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="province-select" class="form-label">Tỉnh thành *</label>
                                <select class="form-select" id="province-select" required>
                                    <c:forEach var="item" items="${provinces}">
                                        <option value="${item.provinceId}">${item.provinceName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="showroom-select" class="form-label">Showroom *</label>
                                <select class="form-select" id="showroom-select" name="showroomId" required>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="other-request" class="form-label">Yêu cầu khác</label>
                            <textarea
                                    class="form-control"
                                    id="other-request"
                                    rows="2"
                                    placeholder="Ghi yêu cầu của Quý khách tại đây"
                                    name="additionalNotes"
                            ></textarea>
                        </div>
                        <button type="button" class="btn btn-primary w-100" id="registration">
                            ĐĂNG KÝ LÁI THỬ
                        </button>

                        <div class="form-check mb-3 mt-4">
                            <input class="form-check-input" type="checkbox" id="promotion" />
                            <label class="form-check-label" for="promotion">
                                Đăng ký nhận thông tin chương trình khuyến mãi, dịch vụ từ
                                VinFast
                            </label>
                        </div>

                        <!-- Dòng thông tin hotline -->
                        <p class="text-center mt-3">
                            <strong
                            >Mọi thắc mắc xin liên hệ - HOTLINE -
                                <span class="text-center mt-4">1900 23 23 89</span></strong
                            >
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/template/web/assets/js/test-drive.js"></script>
</body>
</html>
