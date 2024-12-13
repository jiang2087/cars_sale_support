<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 13/12/2024
  Time: 12:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Accordion với Điều Hướng</title>
</head>
<body>
<section id="main-compare-car">
    <div id="over-flay">
        <!-- Tiêu đề -->
        <div>So Sánh Xe</div>
        <!-- Container chứa các ô chọn -->
        <div class="selection-container container">
                <div class="card" data-bs-toggle="modal" data-bs-target="#carSelectModal">
                    <div>
                        <div class="text-primary" style="font-size: 50px">+</div>
                        <p class="text-muted mb-0">Lựa chọn xe</p>
                    </div>
                </div>
                <!-- Ô lựa chọn 2 -->
                <div class="card" data-bs-toggle="modal" data-bs-target="#carSelectModal">
                    <div>
                        <div class="text-primary" style="font-size: 50px">+</div>
                        <p class="text-muted mb-0">Lựa chọn xe</p>
                    </div>
                </div>
            <!-- Ô lựa chọn 1 -->
        </div>

        <!-- Modal -->
        <div
                class="modal fade"
                id="carSelectModal"
                tabindex="-1"
                aria-labelledby="carSelectModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-title" id="carSelectModalLabel">
                            Chọn tối đa 2 phiên bản xe
                        </div>
                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-section">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="vf3" />
                                        <label class="form-check-label" for="vf3">VF 3</label>
                                    </div>
                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="vf5plus"
                                        />
                                        <label class="form-check-label" for="vf5plus"
                                        >VF 5 Plus</label
                                        >
                                    </div>

                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="vf8splus"
                                        />
                                        <label class="form-check-label" for="vf5plus"
                                        >VF 8s LUX</label
                                        >
                                    </div>

                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="vf8pluslux"
                                        />
                                        <label class="form-check-label" for="vf5plus"
                                        >VF 8Plus LUX</label
                                        >
                                    </div>
                                    <!-- Thêm các tùy chọn khác -->
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-section">
                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="fadil"
                                        />
                                        <label class="form-check-label" for="fadil">VF e34</label>
                                    </div>
                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="8plus"
                                        />
                                        <label class="form-check-label" for="8plus"
                                        >VF 8 Plus</label
                                        >
                                    </div>

                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="vf9eco"
                                        />
                                        <label class="form-check-label" for="vf9eco">VF 9 eco</label>
                                    </div>

                                    <div class="form-check">
                                        <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="vf6plus"
                                        />
                                        <label class="form-check-label" for="vf6plus"
                                        >VF 6 Plus</label
                                        >
                                    </div>
                                    <!-- Thêm các tùy chọn khác -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal"
                        >
                            Đóng
                        </button>
                        <button type="button" class="btn btn-primary">Chọn xe</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container my-4">
            <!-- Danh sách điều hướng -->
            <ul class="navigation">
                <li>
                    <a href="#section1" class="nav-item" data-bs-target="#collapse1"
                    >Kích thước</a
                    >
                </li>
                <li>
                    <a href="#section2" class="nav-item" data-bs-target="#collapse2"
                    >Động cơ & Vận hành</a
                    >
                </li>
                <li>
                    <a href="#section3" class="nav-item" data-bs-target="#collapse3"
                    >Ngoại thất</a
                    >
                </li>
                <li>
                    <a href="#section4" class="nav-item" data-bs-target="#collapse4"
                    >Nội thất</a
                    >
                </li>
                <li>
                    <a href="#section5" class="nav-item" data-bs-target="#collapse5"
                    >An ninh & An toàn</a
                    >
                </li>
                <li>
                    <a href="#section6" class="nav-item" data-bs-target="#collapse6"
                    >Hệ thống hỗ trợ lái xe ADAS</a
                    >
                </li>
            </ul>

            <div class="accordion" id="fullAccordion">
                <div class="accordion-item mb-3" id="section1">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse1"
                        >
                            Kích thước
                        </button>
                    </div>
                    <div id="collapse1" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2"><strong>Dài x Rộng x Cao (mm)</strong></td>
                                </tr>
                                <tr>
                                    <td>4.241 x 1.834 x 1.580</td>
                                    <td>4.545 x 1.890 x 1.635,75</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Chiều dài cơ sở (mm)</strong></td>
                                </tr>
                                <tr>
                                    <td>2.730</td>
                                    <td>2.840</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section2">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse2"
                        >
                            Động cơ & Vận hành
                        </button>
                    </div>
                    <div id="collapse2" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <strong>Công suất tối đa của động cơ (hp)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>201</td>
                                    <td>175</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Mô men xoắn cực đại (Nm/rpm)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>310</td>
                                    <td>250</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Dẫn động</strong></td>
                                </tr>
                                <tr>
                                    <td>FWD/Cầu trước</td>
                                    <td>FWD/Cầu trước</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Hệ thống treo trước</strong></td>
                                </tr>
                                <tr>
                                    <td>Độc lập kiểu MacPherson</td>
                                    <td>Độc lập kiểu MacPherson</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Hệ thống treo sau</strong></td>
                                </tr>
                                <tr>
                                    <td>Thanh điều hướng đa điểm</td>
                                    <td>Thanh điều hướng đa điểm</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Trợ lực lái</strong></td>
                                </tr>
                                <tr>
                                    <td>Trợ lực điện</td>
                                    <td>Trợ lực điện</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Quãng đường chạy một lần sạc đầy (km)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>460 (NEDC)</td>
                                    <td>430 (NEDC)</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section3">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse3"
                        >
                            Ngoại thất
                        </button>
                    </div>
                    <div id="collapse3" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2"><strong>Đèn pha</strong></td>
                                </tr>
                                <tr>
                                    <td>LED</td>
                                    <td>
                                        LED, tự động bật/tắt, điều chỉnh góc chiếu thông minh
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Đèn chiếu sáng ban ngày</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>LED</td>
                                    <td>LED</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Gương chiếu hậu</strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        Chỉnh điện, gập điện, báo rẽ, sấy mặt gương, tự động chỉnh
                                        khi lùi
                                    </td>
                                    <td>
                                        Chỉnh điện, gập điện, nhớ vị trí, tích hợp báo rẽ, sấy mặt
                                        gương, tự động chỉnh khi lùi (OPT)
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Chức năng gạt mưa trước</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tự động</td>
                                    <td>Tự động</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Cửa sổ trời</strong></td>
                                </tr>
                                <tr>
                                    <td>Không</td>
                                    <td>Không</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section4">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse4"
                        >
                            Nội thất
                        </button>
                    </div>
                    <div id="collapse4" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2"><strong>Số chỗ ngồi</strong></td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Màn hình giải trí cảm ứng </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>12,9 inch</td>
                                    <td>12,9 inch</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Màn hình hiển thị HUD </strong></td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Tùy chọn</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Cấu hình ghế lái </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Chỉnh điện 8 hướng, có thông gió</td>
                                    <td>Chỉnh điện 8 hướng</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Cấu hình ghế phụ </strong></td>
                                </tr>
                                <tr>
                                    <td>Chỉnh cơ 4 hướng</td>
                                    <td>Chỉnh cơ 4 hướng</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Điều chỉnh hướng vô lăng </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Chỉnh cơ 4 hướng</td>
                                    <td>Chỉnh cơ 4 hướng</td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Loại vô lăng </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Bọc da, tích hợp nút bấm điều khiển tính năng giải trí,
                                        nút bấm điều khiển ADAS
                                    </td>
                                    <td>
                                        Bọc da, dạng D-cut, tích hợp nút bấm điều khiển nhiều tính
                                        năng giải trí và ADAS
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Hệ thống điều hòa </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tự động, 2 vùng</td>
                                    <td>
                                        Tự động, 2 vùng, tích hợp chức năng kiểm soát chất lượng
                                        không khí và ion hoá không khí
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Cổng USB </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4 cổng</td>
                                    <td>2 cổng</td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Kết nối Bluetooth, Wi-Fi </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Hệ thống âm thanh </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>6 loa, Không có loa táp lô</td>
                                    <td>6 loa</td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <strong>Gói dịch vụ thông minh VinFast connect </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section5">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse5"
                        >
                            An ninh & An toàn
                        </button>
                    </div>
                    <div id="collapse5" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hệ thống chống bó cứng phanh (ABS)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng phân phối lực phanh điện tử (EBD)</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Chức năng hỗ trợ lực phanh khẩn cấp (BA)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hệ thống cân bằng điện tử (ESC)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Chức năng kiểm soát lực kéo (TCS)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng hỗ trợ khởi hành ngang dốc (HSA)</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Chức năng chống lật (ROM)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Hỗ trợ giữ làn (LAS)</strong></td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong
                                        >Chức năng tự động khóa cửa khi xe di chuyển</strong
                                        >
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Hệ thống túi khí</strong></td>
                                </tr>
                                <tr>
                                    <td>7 túi khí</td>
                                    <td>6 túi khí</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Giám sát áp suất lốp</strong></td>
                                </tr>
                                <tr>
                                    <td>dTPMS</td>
                                    <td>dTPMS</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Căng đai khẩn cấp ghế trước và ghế hàng 2</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="accordion-item mb-3" id="section6">
                    <div class="accordion-header">
                        <button
                                class="accordion-button"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapse6"
                        >
                            Hệ thống hỗ trợ lái xe ADAS
                        </button>
                    </div>
                    <div id="collapse6" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hỗ trợ lái trên đường cao tốc (Level 2)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hỗ trợ giữ làn khẩn cấp</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Nhận biết biển báo giao thông</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hệ thống giám sát lái xe</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Kiểm soát đi giữa làn</strong></td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Hỗ trợ di chuyển khi ùn tắc (Level 2)</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Kiểm soát hành trình</strong></td>
                                </tr>
                                <tr>
                                    <td>Giám sát hành trình thích ứng</td>
                                    <td>Cơ bản</td>
                                </tr>
                                <tr>
                                    <td>Giám sát hành trình thích ứng</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Điều chỉnh tốc độ thông minh</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Có</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Cảnh báo va chạm phía trước</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Phanh tự động khẩn cấp trước</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Phanh tự động khẩn cấp sau</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Cảnh báo va chạm khi ở giao lộ</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Tự động giữ làn khẩn cấp</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <strong>Cảnh báo phương tiện cắt ngang phía sau</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Có</td>
                                    <td>Không</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
    document.querySelectorAll(".nav-item").forEach((item) => {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            const targetId = item.getAttribute("data-bs-target");

            // Đóng tất cả các accordion trước
            const accordionItems = document.querySelectorAll(".accordion-collapse");
            accordionItems.forEach((acc) => {
                const collapse = new bootstrap.Collapse(acc, { toggle: false });
                collapse.hide();
            });

            // Mở accordion tương ứng
            const targetCollapse = document.querySelector(targetId);
            const collapse = new bootstrap.Collapse(targetCollapse, {
                toggle: true,
            });

            // Thêm class active vào mục đã chọn
            document.querySelectorAll(".nav-item").forEach((link) => {
                link.classList.remove("active");
            });
            item.classList.add("active");
        });
    });
</script>
</html>

