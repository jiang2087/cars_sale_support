<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 14/12/2024
  Time: 10:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tùy chọn ngân sách</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
    <div>
        <img src="${pageContext.request.contextPath}/template/uploads/car/detail-car/vf3.jpg" width="100%" height="50%" alt="">
    </div>

    <div class="container pricing-container">
        <h2 class="text-center mb-4">Tùy chọn cho ngân sách của bạn.</h2>
        <div class="row justify-content-center">
            <div class="col-md-5 mb-3">
                <div class="pricing-card">
                    <h5>Giá xe thuê Pin</h5>
                    <span>240.000.000 VNĐ</span>
                </div>
            </div>
            <div class="col-md-5 mb-3">
                <div class="pricing-card">
                    <h5>Giá xe mua Pin</h5>
                    <span>322.000.000 VNĐ</span>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-md-8">
                <p class="policy-text">
                    Với Khách hàng mua xe thuê pin, VinFast cung cấp chính sách thuê pin theo 3 mốc:
                <ul>
                    <li>900.000 VNĐ/tháng cho quãng đường di chuyển dưới 1.500 km,</li>
                    <li>1.200.000 VNĐ/tháng cho quãng đường di chuyển từ 1.500 đến 2.500 km,</li>
                    <li>2.500.000 VNĐ/tháng cho quãng đường di chuyển trên 2.500 km.</li>
                </ul>
                </p>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4 text-center">
                <button id="btnReserve" class="btn btn-primary w-100 py-2">
                    ĐẶT CỌC 15.000.000 VNĐ
                </button>
            </div>
        </div>
    </div>

    <section class="vf3-intro py-5">
        <div class="container text-center">
            <h2 class="fw-bold">VinFast VF 3 - Xe nhỏ, giá trị lớn.</h2>
            <p class="mb-4">
                Với thiết kế tối giản, nhỏ gọn, cá tính và năng động, VinFast VF 3 sẽ luôn cùng bạn hoà nhịp với xu thế công nghệ đi chuyển xanh toàn cầu,
                trải nghiệm giá trị trên mỗi hành trình, và tự do thể hiện phong cách sống.
            </p>
            <iframe
                    width="560"
                    height="315"
                    src="https://www.youtube.com/embed/z56derDAHVo?autoplay=1&mute=1"
                    title="YouTube video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
            </iframe>
        </div>
    </section>

    <section class="vf3-color-selection py-5">
        <div class="container text-center">
            <h2 class="fw-bold">VinFast VF 3 - Tự do sáng tạo, tỏa sáng chất riêng!</h2>
            <p class="mb-4">
                Với dải màu ngoại thất đa dạng và độc đáo, bao gồm 9 tùy chọn màu sắc trẻ trung và thời thượng, VF 3 là sự lựa chọn hoàn hảo giúp bạn thỏa sức thể hiện sự khác biệt và cá tính của riêng mình.
            </p>
            <!-- Phần hiển thị xe -->
            <div class="car-preview">

                <img id="car-image" src="${pageContext.request.contextPath}/template/uploads/car/detail-car/Yellow-VF3.png" alt="Car" class="img-fluid" />
            </div>

            <div class="color-options d-flex justify-content-center">
                <div class="color-circle bg-yellow" data-color="yellow" data-image="images/Yellow-VF3.png"></div>
                <div class="color-circle bg-red" data-color="red" data-image="images/Red-VF3.png"></div>
                <div class="color-circle bg-blue" data-color="blue" data-image="images/Blue-VF3.png"></div>
                <div class="color-circle bg-gray" data-color="gray" data-image="images/Gray-VF3.png"></div>
                <div class="color-circle bg-green" data-color="green" data-image="images/Green-VF3.png"></div>
            </div>
            <p id="color-name" class="mt-3 fw-bold">Summer Yellow</p>
        </div>
    </section>

    <!-- quay 360 -->
    <div id="viewer"></div>
    <!-- end quay 369 -->

    <div class="container hero-section">
        <h1 class="title">VF 3 không chỉ là một chiếc xe điện tiên tiến.</h1>
        <p class="subtitle">Mà còn là một tác phẩm nghệ thuật kết hợp giữa công nghệ và sự sáng tạo trong thiết kế.</p>
        <img src="${pageContext.request.contextPath}/template/uploads/car/detail-car/vf3section-5.jpg" alt="VF 3 Electric Car">
    </div>

    <div class="container hero-section">
        <h1 class="title">VinFast VF 3 - Luôn đủ chỗ cho mọi người!</h1>
        <p class="subtitle">Thiết kế thông minh và không gian nội thất tối ưu hóa của VF 3 mang lại trải nghiệm di chuyển tiện lợi,
            đảm bảo sự thoải mái và tiện nghi cho cả 4 chỗ ngồi. Màu sắc nội thất trang nhã, trẻ trung và cá tính,
            cùng chất liệu thân thiện tạo ra một không gian đặc biệt, nơi chứa đựng những kỷ niệm đáng nhớ trên mọi
            hành trình khám phá phong cách sống của riêng bạn! </p>
        <img src="${pageContext.request.contextPath}/template/uploads/car/detail-car/VF3_Interior_Hero.jpg" alt="VF 3 Electric Car">
    </div>

    <div class="container content-section">
        <div class="row align-items-center">
            <!-- Left Section -->
            <div class="col-md-6">
                <h1 class="title">3,5 km - Khoảng cách nhỏ cho mục tiêu lớn</h1>
                <p class="description">
                    Định hình tiên phong thúc đẩy ngành công nghiệp xe điện, hướng tới một tương lai
                    <span class="highlight">Xanh</span> và
                    <span class="highlight">Thông Minh</span>, VinFast đã đầu tư hàng trăm triệu USD phát triển hạ tầng, từng bước
                    <span class="highlight">"phủ rộng"</span> trạm sạc xe điện:
                </p>
                <ul class="description">
                    <li>Hệ thống trạm sạc xe điện VinFast trải dài 63 tỉnh và thành phố.</li>
                    <li>106 tuyến quốc lộ quan trọng đều có trạm sạc.</li>
                    <li>80/85 thành phố đã được lắp đặt hệ thống trạm sạc.</li>
                    <li>Khoảng cách ngắn 3,5 km giữa 2 trạm sạc trong thành phố.</li>
                </ul>
                <p class="description">
                    VinFast cam kết nỗ lực mang đến nhiều tiện ích, giúp hành trình lái xe điện của người Việt thật dễ dàng!
                </p>
            </div>
            <!-- Right Section -->
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/template/uploads/car/detail-car/map.jpg" alt="Bản đồ trạm sạc VinFast" class="map-image">
            </div>
        </div>
    </div>


    <div class="container my-5">
        <div class="text-center">
            <h2 class="fw-bold">Thông số kỹ thuật</h2>
        </div>
        <div class="row mt-4">
            <div class="col-md-7">
                <table class="table table-bordered spec-table">
                    <tbody>
                    <tr>
                        <th>Động cơ</th>
                        <td>01 Motor</td>
                    </tr>
                    <tr>
                        <th>Công suất tối đa (kW)</th>
                        <td>30</td>
                    </tr>
                    <tr>
                        <th>Mô men xoắn cực đại (Nm)</th>
                        <td>110</td>
                    </tr>
                    <tr>
                        <th>Tăng tốc</th>
                        <td>5,3s (0-50 km/h)</td>
                    </tr>
                    <tr>
                        <th>Quãng đường chạy một lần sạc đầy (km)</th>
                        <td>215</td>
                    </tr>
                    <tr>
                        <th>Thời gian nạp pin nhanh nhất</th>
                        <td>36 phút (10% - 70%)</td>
                    </tr>
                    <tr>
                        <th>Dẫn động</th>
                        <td>RWD/Cầu sau</td>
                    </tr>
                    </tbody>
                </table>
                <div class="mt-4">
                    <button class="btn btn-primary btn-custom me-3">Xem thêm</button>
                    <button class="btn btn-secondary btn-custom">Tải Brochure</button>
                </div>
            </div>
            <div class="col-md-5 text-center">
                <img src="${pageContext.request.contextPath}/template/uploads/car/detail-car/Yellow-VF3.png" alt="Car Image" class="img-fluid rounded">
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>

    // video tự chạy
    // script.js
    const video = document.getElementById("myVideo");

    const handleScroll = () => {
        const videoRect = video.getBoundingClientRect();
        const isInView = videoRect.top >= 0 && videoRect.bottom <= window.innerHeight;

        if (isInView) {
            video.play(); // Tự chạy video khi video trong khung nhìn
        } else {
            video.pause(); // Dừng video khi ra ngoài khung nhìn
        }
    };

    window.addEventListener("scroll", handleScroll);
    // end video tự chạy

    // Chọn các phần tử
    const carImage = document.getElementById("car-image");
    const colorOptions = document.querySelectorAll(".color-circle");
    const colorName = document.getElementById("color-name");
    const rotateButton = document.getElementById("rotate-button");

    // Xử lý sự kiện đổi màu
    colorOptions.forEach((circle) => {
        circle.addEventListener("click", () => {
            const imageSrc = circle.getAttribute("data-image");
            const color = circle.getAttribute("data-color");
            carImage.src = imageSrc;
            colorName.textContent = color.charAt(0).toUpperCase() + color.slice(1); // Viết hoa chữ cái đầu
        });
    });


    // js quay 360
    // Cấu hình
    const viewer = document.getElementById('viewer');
    const totalImages = 36; // Số ảnh
    const imagePrefix = 'car'; // Tên prefix của ảnh
    const imageExtension = '.png'; // Định dạng ảnh
    const imagePath = './images/'; // Đường dẫn đến thư mục ảnh

    let currentImageIndex = 1; // Ảnh hiện tại
    let isDragging = false;
    let startX = 0;

    // Hàm hiển thị ảnh
    function updateImage(index) {
        viewer.style.backgroundImage = `url('${imagePath}${imagePrefix}${index}${imageExtension}')`;
    }

    // Lắng nghe sự kiện chuột
    viewer.addEventListener('mousedown', (e) => {
        isDragging = true;
        startX = e.clientX;
    });

    viewer.addEventListener('mousemove', (e) => {
        if (!isDragging) return;
        const deltaX = e.clientX - startX;
        if (Math.abs(deltaX) > 10) { // Đổi ảnh khi di chuyển chuột đủ xa
            if (deltaX > 0) {
                currentImageIndex = (currentImageIndex - 1 + totalImages) % totalImages || totalImages;
            } else {
                currentImageIndex = (currentImageIndex + 1) % totalImages || 1;
            }
            updateImage(currentImageIndex);
            startX = e.clientX; // Cập nhật vị trí mới
        }
    });

    viewer.addEventListener('mouseup', () => {
        isDragging = false;
    });

    viewer.addEventListener('mouseleave', () => {
        isDragging = false;
    });

    // Hiển thị ảnh đầu tiên khi tải trang
    updateImage(currentImageIndex);
    // end js quay 360
</script>
</body>
</html>
