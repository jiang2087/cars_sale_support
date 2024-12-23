<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 17/12/2024
  Time: 4:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Chỉnh sửa dữ liệu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu bài viết</li>
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
                                    Tên: Danh sách bài viết
                                </div>
                                <div class="icon">
                                    <button type="button" id="addBtn">Thêm bài viết<i
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
                            <table id="table-user">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>Tiêu đề</th>
                                    <th>Tác giả</th>
                                    <th>Slogan</th>
                                    <th>Danh mục</th>
                                    <th>Thẻ đính kèm</th>
                                    <th>Số lượt xem</th>
                                    <th>Số bình luận</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${blogs}">
                                    <tr>
                                        <td><input type="radio"></td>
                                        <td>${item.title}</td>
                                        <td>${item.fullName}</td>
                                        <td>${item.slogan}</td>
                                        <td>${item.categoryId}</td>
                                        <td>${item.tags}</td>
                                        <td>${item.views}</td>
                                        <td>100</td>
                                        <td>${item.createdAt}</td>
                                        <td>${item.updatedAt}</td>
                                        <td>
                                            <ul class="action-list">
                                                <li>
                                                    <button type="button" class="editBtn btn btn-primary"
                                                            data-id="${item.blogId}"><i
                                                            class="fa fa-pencil-alt"></i></button>
                                                </li>
                                                <li>
                                                    <button type="button" class="deleteBtn btn btn-danger"
                                                            data-id="${item.blogId}"><i
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
            <h3>Nhập thông tin bài viết</h3>
            <button class="close-btn" id="closeFormBtn">X</button> <!-- Nút đóng -->
        </div>

        <form id="form-blog">
            <input type="hidden" name="blogId" id="blogId">
            <input type="hidden" name="authorId" value="${INFUSER.userId}">
            <input type="hidden" name="categoryId" value="1">
            <div class="row">
                <div class="col-md-12 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="title" name="title"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="title">Tiêu đề</label>
                    </div>
                </div>
                <div class="col-md-12 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="slogan" name="slogan" class="form-control form-control-lg"/>
                        <label class="form-label" for="slogan">Slogan</label>
                    </div>
                </div>
                <div class="col-md-12 mb-4">
                    <div class="image-upload border-black">
                        <img src="" alt="anh-upload" id="uploadImage">
                    </div>
                </div>
                <div id="description-blog"></div>
                <div class="col-md-12 mb-4 btn-form">
                    <button type="button" id="confirmBtn" class="btn btn-success">Xác nhận</button>
                    <label for="file-upload" class="custom-file-upload">
                        Đẩy ảnh
                    </label>
                    <input id="file-upload" type="file" name="file"/>
                    <button type="button" id="cancelBtn" class="btn btn-primary">Hủy bỏ</button>
                </div>
            </div>
        </form>
    </div>
</main>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/mdb.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-blog.js"></script>
</body>
</html>