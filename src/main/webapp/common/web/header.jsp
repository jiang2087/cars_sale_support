<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 27/09/2024
  Time: 9:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header" class="header fixed-top">

    <div class="topbar d-flex align-items-center">
        <div class="container d-flex justify-content-end justify-content-md-between">
            <div class="contact-info d-flex align-items-center">
                <i class="bi bi-phone d-flex align-items-center d-none d-lg-block"><span>+1 5589 55488 55</span></i>
                <i class="bi bi-clock ms-4 d-none d-lg-flex align-items-center"><span>Mon-Sat: 11:00 AM - 23:00 PM</span></i>
            </div>
            <div>
                <a href="<c:url value="/login?action=login"/>" class="cta-btn">Đăng nhập</a>
                <a href="<c:url value="/register?action=register"/>" class="cta-btn">Đăng ký</a>
            </div>

        </div>
    </div><!-- End Top Bar -->

    <div class="branding d-flex align-items-cente">

        <div class="container position-relative d-flex align-items-center justify-content-between">
            <a href="index.html" class="logo d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/template/general/img/logo.png" alt="">
            </a>

            <nav id="navmenu" class="navmenu">
                <ul>
                    <li><a href="<c:url value="/web-home"/>" class="active">Trang chủ</a></li>
                    <li><a href="#about">Giới thiệu</a></li>
                    <li><a id="car-menu" href="javascript:void(0);">Oto</a></li>
                    <li><a href="#specials">Đặc biệt</a></li>
                    <li><a href="#events">Sự kiện</a></li>
                    <li><a href="#chefs">Lãnh đạo</a></li>
                    <li><a href="<c:url value="/web-extensive?action=blogs"/>">Tin tức</a></li>
                    <li class="dropdown"><a href="#"><span>Tiện ích</span> <i
                            class="bi bi-chevron-down toggle-dropdown"></i></a>
                        <ul>
                            <li><a href="<c:url value="/web-extensive?action=compare-cars"/>">So sánh xe</a></li>
                            <li><a href="<c:url value="/web-extensive?action=rolling-cost"/>">Dự toán chi phí lăn bánh</a></li>
                            <li><a href="<c:url value="/web-extensive?action=installment-cost"/>">Dư toán vay trả góp</a></li>
                            <li><a href="<c:url value="/web-extensive?action=test-drive"/>">Đăng ký lái thử</a></li>
                            <li><a href="<c:url value="/web-extensive?action=book"/>">Đặt lịch dịch vụ</a></li>
                        </ul>
                    </li>
                    <li><a href="#contact">Liên hệ </a></li>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>

            <div id="dropdown" class="dropdown-content">
                <div class="car-list">
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF3.png" alt="VF 3" />
                        <p><a href="<c:url value="/web-home?action=detail"/>">VF 3</a></p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF5-plus.png" alt="VF 5 Plus" />
                        <p>VF 5 Plus</p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF6.png" alt="VF 6" />
                        <p>VF 6</p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF-e34.png" alt="VF e34" />
                        <p>VF e34</p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF7.png" alt="VF 7" />
                        <p>VF 7</p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF8.png" alt="VF 8" />
                        <p>VF 8</p>
                    </div>
                    <div class="car-item">
                        <img src="${pageContext.request.contextPath}/template/uploads/car/menu/VF9.png" alt="VF 9" />
                        <p>VF 9</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // JavaScript để xử lý click
        const carMenu = document.getElementById("car-menu");
        const dropdown = document.getElementById("dropdown");

        carMenu.addEventListener("click", () => {
            dropdown.classList.toggle("active"); // Hiển thị hoặc ẩn dropdown
        });

        // Ẩn dropdown nếu click ra ngoài
        document.addEventListener("click", (e) => {
            if (!carMenu.contains(e.target) && !dropdown.contains(e.target)) {
                dropdown.classList.remove("active");
            }
        });
    </script>
</header>
