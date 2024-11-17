<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 17/11/2024
  Time: 2:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng ký</title>

    <!-- Font Icon -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/template/registration/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/registration/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<input type="hidden" id="status" value="${status}">
<div class="main">

    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title"><a>Đăng ký</a></h2>

                    <form method="post" action="<c:url value="/register?action=register"/>" class="register-form"
                          id="register-form">
                        <div class="form-group">
                            <label for="fullName"><i
                                    class="zmdi zmdi-account material-icons-name"></i></label> <input
                                type="text" name="fullName" id="fullName" placeholder="Họ và tên"/>
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                                type="email" name="email" id="email" placeholder="Email"/>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Mật Khẩu"/>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="text" name="phoneNumber" id="phoneNumber"
                                   placeholder="Số điện thoại"/>
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="text" name="address" id="address"
                                   placeholder="Liên hệ"/>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term"
                                   class="agree-term"/> <label for="agree-term"
                                                               class="label-agree-term"><span><span></span></span>Tôi
                            đồng ý với <a href="#" class="term-service">Điều khoản dịch vụ</a></label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup"
                                   class="form-submit" value="Đăng ký"/>
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="${pageContext.request.contextPath}/template/web/assets/img/about.png" alt="sing up image">
                    </figure>
                    <a href="<c:url value="/register?action=register"/>" class="signup-image-link">Tôi đã có tài khoản</a>
                </div>
            </div>
        </div>
    </section>


</div>
<!-- JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status == "success") {
        swal("Chúc mừng", "Tài khoản đã được đăng ký thành công!", "success").then(function () {
            window.location.href = "${pageContext.request.contextPath}/login?action=login";
        });
    } else if (status == "failed") {
        swal("Oh không!", "Email đã tồn tại vui lòng chọn email khác!", "error").then(function (){

        });
    }
</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>




