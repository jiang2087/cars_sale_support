<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/12/2024
  Time: 11:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<section id="main-blogs">
    <div id="over-flay">
        <section id="blog-posts-2" class="blog-posts-2 section">
            <div class="container">
                <div class="row gy-4">
                    <c:forEach var="item" items="${blogs}">
                        <div class="col-lg-4">
                            <article class="position-relative h-100">
                                <div class="post-img position-relative overflow-hidden">
                                    <img
                                            src="${pageContext.request.contextPath}/template/uploads/${item.thumbnail}"
                                            class="img-fluid"
                                            alt="Hình ảnh bài viết"
                                    />
                                </div>

                                <div class="meta d-flex align-items-end">
                                    <span class="post-date">${item.createdAt}</span>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-person"></i>
                                        <span class="ps-2">${item.fullName}</span>
                                    </div>
                                    <span class="px-3 text-black-50">/</span>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-folder2"></i>
                                        <span class="ps-2">Xe điện</span>
                                    </div>
                                </div>

                                <div class="post-content d-flex flex-column">
                                    <div class="post-title">
                                        ${item.title}
                                    </div>
                                    <a href="<c:url value="/web/blog/details?id=${item.blogId}"/>" class="readmore stretched-link">
                                        <span>Xem Thêm</span><i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </article>
                        </div>
                    </c:forEach>
                    <!-- Kết thúc mục bài viết -->

                    <section id="blog-pagination" class="blog-pagination section">
                        <div class="container">
                            <div class="d-flex justify-content-center">
                                <ul>
                                    <li>
                                        <a href="#"><i class="bi bi-chevron-left"></i></a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#" class="active">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li>...</li>
                                    <li><a href="#">10</a></li>
                                    <li>
                                        <a href="#"><i class="bi bi-chevron-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>
</body>
</html>
