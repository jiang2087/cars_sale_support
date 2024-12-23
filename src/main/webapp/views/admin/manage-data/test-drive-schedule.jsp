<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 14/12/2024
  Time: 4:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="link" value="/api-admin-newUser"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/mdb.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/table.css">
</head>
<body>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Chỉnh sửa dữ liệu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu sản phẩm</li>
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
                                    Tên: Lịch đăng ký lái thử
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
                                    Hiển thị
                                    <select name="limit" id="selectOp">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                    </select>
                                    bản ghi
                                </div>
                                <div class="search-child">
                                    Search:
                                    <input type="search" name="keyword" id="search">
                                </div>
                            </div>
                            <table id="table-test-drive">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Mã</th>
                                    <th>Họ và tên</th>
                                    <th>Số điện thoạt</th>
                                    <th>Email</th>
                                    <th>Xe thử</th>
                                    <th>Showroom</th>
                                    <th>Địa chỉ showroom</th>
                                    <th>Ngày gửi yêu cầu</th>
                                    <th>Yêu cầu đính kèm</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày lái thử</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${tdrs}">
                                    <tr>
                                        <td><input type="radio"></td>
                                        <td>${item.registrationId}</td>
                                        <td>${item.fullName}</td>
                                        <td>${item.phoneNumber}</td>
                                        <td>${item.email}</td>
                                        <td>${item.modelName}</td>
                                        <td>${item.name}</td>
                                        <td>${item.address}</td>
                                        <td>${item.registrationDate}</td>
                                        <td>${item.additionalNotes}</td>
                                        <td>${item.status}</td>
                                        <c:if test="${empty item.testDriveAt}">
                                            <td>Chưa thiết lập</td>
                                        </c:if>
                                        <c:if test="${not empty item.testDriveAt}">
                                            <td>${item.testDriveAt}</td>
                                        </c:if>
                                        <td>
                                            <ul class="action-list">
                                                <li>
                                                    <button type="button" class="confirmBtn btn btn-primary"
                                                            data-id="${item.registrationId}"><i
                                                            class="fa fa-pencil-alt"></i></button>
                                                </li>
                                                <li>
                                                    <button type="button" class="cancelBtn btn btn-danger"
                                                            data-id="${item.registrationId}"><i class="fa-solid fa-xmark"></i></button>
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

    <div id="myForm" style="width: 40%; height: 20%; top: 40%; right: 30%;">
        <div class="row">
            <input type="hidden" id="testId">
            <div class="col-12">
                <div data-mdb-input-init class="form-outline mb-3">
                    <input type="datetime-local" id="testDate" name="testDriveAt"
                           class="form-control form-control-lg"/>
                    <label class="form-label" for="testDate">Chọn thời gian cho lịch chạy thử</label>
                </div>
            </div>
            <div class="col-12 d-flex justify-content-center">
                <button type="button" class="btn btn-primary me-2" id="confirmBtn">Xác nhận</button>
                <button type="button" class="btn btn-danger" id="cancelBtn">Hủy</button>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/mdb.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/test-drive.js"></script>
</body>
</html>



