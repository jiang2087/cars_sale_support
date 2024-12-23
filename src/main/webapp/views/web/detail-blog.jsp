<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 16/12/2024
  Time: 9:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<section id="main-blogs">
    <div id="over-flay">
        <main class="main">

            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Phần Chi Tiết Bài Viết -->
                        <section id="blog-details" class="blog-details section">
                            <div class="container">
                                <article class="article">
                                    <div class="post-img">
                                        <img
                                                src="${pageContext.request.contextPath}/template/uploads/${blog.thumbnail}"
                                                alt="Hình ảnh bài viết"
                                                class="img-fluid"
                                        />
                                    </div>

                                    <h2 class="title">
                                        ${blog.title}
                                    </h2>

                                    <div class="meta-top">
                                        <ul>
                                            <li class="d-flex align-items-center">
                                                <i class="bi bi-person"></i>
                                                <a href="#">${blog.fullName}</a>
                                            </li>
                                            <li class="d-flex align-items-center">
                                                <i class="bi bi-clock"></i>
                                                <a href="#"
                                                >
                                                    <time datetime="${blog.createdAt}"
                                                    >Ngày 1 Tháng 1, 2022
                                                    </time
                                                    >
                                                </a
                                                >
                                            </li>
                                            <li class="d-flex align-items-center">
                                                <i class="bi bi-chat-dots"></i>
                                                <a href="#">${totalComments} Bình Luận</a>
                                            </li>
                                            <li class="d-flex align-items-center">
                                                <i class="bi bi-eye"></i>
                                                <a href="#">${blog.views} Lượt xem</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Kết Thúc meta top -->

                                    <div class="content">
                                        <p>
                                            VinFast, thương hiệu ô tô Việt Nam, nổi bật với thiết kế hiện đại, công nghệ
                                            tiên tiến và chất lượng vượt trội. Từ xe xăng đến xe điện, VinFast đã khẳng
                                            định vị thế trên thị trường quốc tế, góp phần vào xu hướng chuyển đổi năng
                                            lượng sạch. Thành công của VinFast không chỉ mang lại niềm tự hào cho Việt
                                            Nam mà còn mở ra cơ hội lớn cho ngành ô tô trong tương lai.
                                        </p>

                                        <blockquote>
                                            <p>
                                                ${blog.slogan}
                                            </p>
                                        </blockquote>

                                        ${blog.content}
                                    </div>
                                    <!-- Kết Thúc nội dung bài viết -->

                                    <div class="meta-bottom">
                                        <i class="bi bi-folder"></i>
                                        <ul class="cats">
                                            <li><a href="#">Kinh Doanh</a></li>
                                        </ul>

                                        <i class="bi bi-tags"></i>
                                        <ul class="tags">
                                            <li><a href="#">Sáng Tạo</a></li>
                                            <li><a href="#">Mẹo Hay</a></li>
                                            <li><a href="#">Thời Trang</a></li>
                                        </ul>
                                    </div>
                                    <!-- Kết Thúc meta bottom -->
                                </article>
                            </div>
                        </section>
                        <!-- Kết Thúc Phần Chi Tiết Bài Viết -->

                        <!-- Phần Bình Luận Bài Viết -->
                        <section id="blog-comments" class="blog-comments section">
                            <div class="container">
                                <h4 class="comments-count">${totalComments} Bình Luận</h4>
                                <c:forEach var="item" items="${comments}">
                                    <div class="comment">
                                        <div class="d-flex">
                                            <div class="comment-img">
                                                <img
                                                        src="${pageContext.request.contextPath}/template/uploads/${item.avatar}"
                                                        alt="Hình ảnh bình luận"
                                                />
                                            </div>
                                            <div>
                                                <h5>
                                                    <a href="">${item.fullName}</a>
                                                    <a href="#" class="reply"
                                                    ><i class="bi bi-reply-fill"></i> Trả lời</a
                                                    >
                                                </h5>
                                                <time datetime="2020-01-01">${item.createAt}</time>
                                                <p>
                                                    ${item.content}
                                                </p>
                                            </div>
                                        </div>
                                        <c:forEach var="itemChild" items="${item.reply}">
                                            <div class="comment comment-reply">
                                                <div class="d-flex">
                                                    <div class="comment-img">
                                                        <img
                                                                src="${pageContext.request.contextPath}/template/uploads/${itemChild.avatar}"
                                                                alt="Hình ảnh trả lời bình luận"
                                                        />
                                                    </div>
                                                    <div>
                                                        <h5>
                                                            <a href="">${itemChild.fullName}</a>
                                                            <a href="#" class="reply"
                                                            ><i class="bi bi-reply-fill"></i> Trả lời</a
                                                            >
                                                        </h5>
                                                        <time datetime="2020-01-01">${itemChild.createAt}</time>
                                                        <p>
                                                                ${itemChild.content}
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>

                            </div>
                        </section>
                        <!-- Kết Thúc Phần Bình Luận Bài Viết -->

                        <!-- Comment Form Section -->
                        <section id="comment-form" class="comment-form section">
                            <div class="container">
                                <form id="form-comment">
                                    <h4>Đăng Bình Luận</h4>
                                    <c:if test="${empty INFUSER}">
                                        <p>
                                            Bạn phải đăng nhập vào hệ thống mới có thể đăng bình luận cho bài viết*
                                        </p>
                                    </c:if>
                                    <input type="hidden" name="userId" value="${INFUSER.userId}">
                                    <input type="hidden" name="blogId" id="blogId" value="${blog.blogId}">
                                    <div class="row">
                                        <div class="col form-group">
                                          <textarea
                                                  name="content"
                                                  class="form-control"
                                                  placeholder="Bình Luận Của Bạn*"
                                          ></textarea>
                                        </div>
                                    </div>
                                    <c:if test="${empty INFUSER}">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary" disabled>
                                                Đăng Bình Luận
                                            </button>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty INFUSER}">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary" id="post-comment">
                                                Đăng Bình Luận
                                            </button>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                        </section>
                        <!-- /Comment Form Section -->
                    </div>

                    <div class="col-lg-4 sidebar">
                        <div class="widgets-container">
                            <!-- Widget Tác Giả Blog -->
                            <div class="blog-author-widget widget-item">
                                <div class="d-flex flex-column align-items-center">
                                    <div class="d-flex align-items-center w-100">
                                        <img
                                                src="${pageContext.request.contextPath}/template/uploads/${author.avatar}"
                                                class="rounded-circle flex-shrink-0"
                                                alt="Ảnh tác giả"
                                        />
                                        <div>
                                            <h4>${author.fullName}</h4>
                                            <div class="social-links">
                                                <a href="https://x.com/#"><i class="bi bi-twitter-x"></i></a>
                                                <a href="https://facebook.com/#"><i class="bi bi-facebook"></i></a>
                                                <a href="https://instagram.com/#"><i class="bi bi-instagram"></i></a>
                                                <a href="https://linkedin.com/#"><i class="bi bi-linkedin"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <p>
                                        ${author.description}
                                    </p>
                                </div>
                            </div>
                            <!--/Widget Tác Giả Blog -->

                            <!-- Widget Tìm Kiếm -->
                            <div class="search-widget widget-item">
                                <h3 class="widget-title">Tìm Kiếm</h3>
                                <form action="">
                                    <input type="text" placeholder="Nhập từ khóa tìm kiếm..."/>
                                    <button type="submit" title="Tìm Kiếm">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </form>
                            </div>
                            <!--/Widget Tìm Kiếm -->

                            <!-- Widget Danh Mục -->
                            <div class="categories-widget widget-item">
                                <h3 class="widget-title">Danh Mục</h3>
                                <ul class="mt-3">
                                    <li><a href="#">Chung <span>(25)</span></a></li>
                                    <li><a href="#">Phong Cách Sống <span>(12)</span></a></li>
                                    <li><a href="#">Du Lịch <span>(5)</span></a></li>
                                    <li><a href="#">Thiết Kế <span>(22)</span></a></li>
                                    <li><a href="#">Sáng Tạo <span>(8)</span></a></li>
                                    <li><a href="#">Giáo Dục <span>(14)</span></a></li>
                                </ul>
                            </div>
                            <!--/Widget Danh Mục -->

                            <!-- Widget Bài Viết Mới -->
                            <div class="recent-posts-widget-2 widget-item">
                                <h3 class="widget-title">Bài Viết Mới</h3>

                                <div class="post-item">
                                    <h4><a href="blog-details.html">Không có gì ngoài niềm vui</a></h4>
                                    <time datetime="2020-01-01">Ngày 1 Tháng 1, 2020</time>
                                </div>
                                <!-- Kết Thúc bài viết mới #1 -->

                                <div class="post-item">
                                    <h4><a href="blog-details.html">Cách chọn trang phục phù hợp</a></h4>
                                    <time datetime="2020-01-01">Ngày 1 Tháng 1, 2020</time>
                                </div>
                                <!-- Kết Thúc bài viết mới #2 -->

                                <div class="post-item">
                                    <h4>
                                        <a href="blog-details.html">Phong cách sáng tạo trong phối đồ</a>
                                    </h4>
                                    <time datetime="2020-01-01">Ngày 1 Tháng 1, 2020</time>
                                </div>
                                <!-- Kết Thúc bài viết mới #3 -->

                                <div class="post-item">
                                    <h4><a href="blog-details.html">Xu hướng thời trang năm 2023</a></h4>
                                    <time datetime="2020-01-01">Ngày 1 Tháng 1, 2020</time>
                                </div>
                                <!-- Kết Thúc bài viết mới #4 -->

                                <div class="post-item">
                                    <h4><a href="blog-details.html">Cách làm nổi bật cá tính qua trang phục</a></h4>
                                    <time datetime="2020-01-01">Ngày 1 Tháng 1, 2020</time>
                                </div>
                                <!-- Kết Thúc bài viết mới #5 -->
                            </div>
                            <!--/Widget Bài Viết Mới -->

                            <!-- Widget Thẻ Tag -->
                            <div class="tags-widget widget-item">
                                <h3 class="widget-title">Thẻ Tag</h3>
                                <ul>
                                    <li><a href="#">Ứng Dụng</a></li>
                                    <li><a href="#">Công Nghệ</a></li>
                                    <li><a href="#">Kinh Doanh</a></li>
                                    <li><a href="#">Mac</a></li>
                                    <li><a href="#">Thiết Kế</a></li>
                                    <li><a href="#">Văn Phòng</a></li>
                                    <li><a href="#">Sáng Tạo</a></li>
                                    <li><a href="#">Studio</a></li>
                                    <li><a href="#">Thông Minh</a></li>
                                    <li><a href="#">Mẹo</a></li>
                                    <li><a href="#">Marketing</a></li>
                                </ul>
                            </div>
                            <!--/Widget Thẻ Tag -->
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/template/web/assets/js/blog.js"></script>
</body>
</html>
