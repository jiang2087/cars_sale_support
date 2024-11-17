<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 05/10/2024
  Time: 12:47 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="link" value="/api-admin-newUser"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<main id="main" class="main">
    <div class="pagetitle">
        <h1>Edit Data</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value="/admin-home"/>">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu người dùng</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form action="<c:url value="/admin/data/users"/>" id="form-submit" method="get">
                            <div class="content-2-1 d-flex justify-content-between align-items-center mt-1">
                                <div class="title">
                                    Tên: Danh sách người dùng
                                </div>
                                <div class="icon">
                                    <a href="<c:url value="/admin-users?type=edit"/>">
                                        <button type="button" id="addBtn">Thêm bản ghi<i
                                                class="fa-solid fa-plus"></i></button>
                                    </a>
                                </div>
                            </div>
                            <hr>
                            <div class="desc">DataTables has most features enabled by default, so all you need
                                to do to use it with
                                your
                                own tables is to call the construction function: $().DataTable();
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
                            <table>
                                <tr>
                                    <th>Id</th>
                                    <th>Họ và tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Vai trò</th>
                                    <th>Loại</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thiết lập</th>
                                </tr>
                                <c:forEach var="item" items="${list}">
                                    <tr>
                                        <td>${item.userId}</td>
                                        <td>${item.fullName}</td>
                                        <td>${item.email}</td>
                                        <td>${item.phoneNumber}</td>
                                        <td>${item.address}</td>
                                        <td>${item.role}</td>
                                        <td>${item.accountType}</td>
                                        <td>${item.status}</td>
                                        <td>${item.createdAt}</td>
                                        <td class="d-flex justify-content-between">
                                            <a href="<c:url value="/admin-users?type=edit&userId=${item.userId}"/> "
                                               title="update"><i class="fa-regular fa-pen-to-square"></i></a>
                                            <button type="button" title="delete" class="deleteBtn"
                                                    data-id="${item.userId}"><i
                                                    class="fa-regular fa-trash-can"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <input type="hidden" id="page" name="page">
                            <input type="hidden" name="type" id="'type" value="list">
                        </form>
                        <div class="paging">
                            <ul id="pagination-demo" class="pagination-sm"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    var totalP = ${books.totalPage};
    var currentP = ${books.page};
    var visibleP = ${books.limit};
    $(function () {
        window.pagObj = $('#pagination-demo').twbsPagination({
            totalPages: totalP,
            visiblePages: visibleP,
            startPage: currentP,

            onPageClick: function (event, page) {
                $('#page-content').text('Page ' + page);
                $('#page').val(page);
                if (page != currentP) {
                    $('#form-submit').submit();
                }
            }
        });
        $('#search').keypress(function (event) {
            if (event.which == 13) {
                $('#form-submit').submit();
            }
        })
        $('.deleteBtn').click(function () {
            var data = {userId: $(this).data('id')};
            if (confirm('Are you sure want to delete this book?')) {
                $.ajax({
                    url: '${link}',
                    type: 'DELETE',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (response) {
                        alert('Delete successful!');
                        location.reload();
                    },
                    error: function (error) {
                        alert('Have error');
                    }
                });
            }
        });
    });
</script>

