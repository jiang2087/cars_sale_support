<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 13/12/2024
  Time: 12:38 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section id="main-installment-car">
    <div id="over-flay">
        <div class="container my-5">
            <!-- Header -->
            <div class="text-center mb-4">
                <h2 class="fw-bold">Dự toán chi phí trả góp</h2>
                <p class="text-muted">
                    Các giá trị dự toán này chỉ mang tính chất tham khảo. Để nhận thông tin cụ thể và chính xác,
                    Quý khách vui lòng liên hệ với showroom hoặc đại lý gần nhất.
                </p>
            </div>

            <div class="row">
                <!-- Car Image and Loan Info -->
                <div class="col-md-6">
                    <div class="text-center mb-4">
                        <img src="https://via.placeholder.com/400x300" alt="Car Image" class="img-fluid">
                    </div>
                    <!-- Thông tin xe và chi tiết khoản vay -->
                    <table class="table table-borderless">
                        <tbody>
                        <tr>
                            <th scope="row" class="text-muted">Giá xe VF 3</th>
                            <td class="text-end fw-bold">240.000.000 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted">Trả trước</th>
                            <td class="text-end">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted">Số tiền vay</th>
                            <td class="text-end fw-bold">240.000.000 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted">Lãi suất (%/năm)</th>
                            <td class="text-end">8 %</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted">Số tiền lãi</th>
                            <td class="text-end">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted fw-bold">Tổng tiền Vay & Lãi</th>
                            <td class="text-end text-primary fw-bold fs-5">240.000.000 VNĐ</td>
                        </tr>
                        </tbody>
                    </table>
                    <p class="text-muted text-center">
                        Các giá trị dự toán chỉ có tính chất tham khảo. Để nhận thông tin chính xác hơn, vui lòng liên hệ tại
                        <a href="#" class="text-decoration-none">Đại lý/Showroom gần nhất</a>.
                    </p>
                </div>

                <!-- Loan Calculation Form -->
                <div class="col-md-6">
                    <form>
                            <!-- Car Model -->
                            <div class="mb-3">
                                <label for="carModel" class="form-label">Mẫu xe</label>
                                <select class="form-select" id="carModel">
                                    <option selected>VF 3</option>
                                    <option>VF 5</option>
                                    <option>VF 8</option>
                                </select>
                            </div>

                            <!-- Version -->
                            <div class="mb-3">
                                <label for="carVersion" class="form-label">Phiên bản</label>
                                <select class="form-select" id="carVersion">
                                    <option selected>Tiêu chuẩn</option>
                                    <option>Cao cấp</option>
                                </select>
                            </div>

                            <!-- Loan Package -->
                            <div class="mb-3">
                                <label for="loanType" class="form-label">Gói vay</label>
                                <select class="form-select" id="loanType">
                                    <option selected>Vay thông thường</option>
                                    <option>Vay ưu đãi</option>
                                </select>
                            </div>

                            <!-- Loan Duration -->
                            <div class="mb-3">
                                <label class="form-label">Thời gian vay</label>
                                <div class="d-flex gap-2 flex-wrap">
                                    <button type="button" class="btn btn-outline-secondary btn-sm">1</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">2</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">3</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">4</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">5</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">6</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">7</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">8</button>
                                </div>
                            </div>

                            <!-- Down Payment -->
                            <div class="mb-3">
                                <label class="form-label">Số tiền trả trước</label>
                                <div class="d-flex gap-2 flex-wrap">
                                    <button type="button" class="btn btn-outline-secondary btn-sm">20%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">30%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">40%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">50%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">60%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">70%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">80%</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">90%</button>
                                </div>
                            </div>

                            <!-- Bank -->
                            <div class="mb-3">
                                <label for="bank" class="form-label">Ngân hàng</label>
                                <select class="form-select" id="bank">
                                    <option selected>Ngân Hàng TMCP Phát Triển TP.HCM (HD BANK)</option>
                                    <option>Ngân Hàng BIDV</option>
                                    <option>Ngân Hàng Vietcombank</option>
                                </select>
                            </div>

                            <!-- Interest Rate -->
                            <div class="mb-3">
                                <label for="interestRate" class="form-label">Lãi suất</label>
                                <select class="form-select" id="interestRate">
                                    <option selected>8%</option>
                                    <option>10%</option>
                                    <option>12%</option>
                                </select>
                            </div>

                            <!-- Loan Submit Button -->
                            <div class="text-center">
                                <button type="button" class="btn btn-dark w-100" data-bs-toggle="modal" data-bs-target="#paymentScheduleModal">
                                    LỊCH TRẢ GÓP CHI TIẾT
                                </button>
                            </div>
                        </form>
                </div>
            </div>
        </div>

        <!-- Modal for Payment Schedule -->
        <div class="modal fade" id="paymentScheduleModal" tabindex="-1" aria-labelledby="paymentScheduleLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h5 class="modal-title fw-bold" id="paymentScheduleLabel">Bảng dự toán chi phí trả góp từng tháng</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <table class="table table-striped text-center align-middle">
                            <thead class="table-primary">
                            <tr>
                                <th>Kỳ thanh toán</th>
                                <th>Dư nợ đầu kỳ</th>
                                <th>Trả nợ gốc</th>
                                <th>Trả lãi</th>
                                <th>Tổng thanh toán</th>
                                <th>Dư nợ cuối kỳ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Tháng 1</td>
                                <td>120.000.000</td>
                                <td>3.333.333</td>
                                <td>800.000</td>
                                <td>4.133.333</td>
                                <td>116.666.667</td>
                            </tr>
                            <tr>
                                <td>Tháng 2</td>
                                <td>116.666.667</td>
                                <td>3.333.333</td>
                                <td>777.778</td>
                                <td>4.111.111</td>
                                <td>113.333.333</td>
                            </tr>
                            <tr>
                                <td>Tháng 3</td>
                                <td>113.333.333</td>
                                <td>3.333.333</td>
                                <td>755.556</td>
                                <td>4.088.889</td>
                                <td>110.000.000</td>
                            </tr>
                            <tr>
                                <td>Tháng 4</td>
                                <td>110.000.000</td>
                                <td>3.333.333</td>
                                <td>733.333</td>
                                <td>4.066.667</td>
                                <td>106.666.667</td>
                            </tr>
                            <tr>
                                <td>Tháng 5</td>
                                <td>106.666.667</td>
                                <td>3.333.333</td>
                                <td>711.111</td>
                                <td>4.044.444</td>
                                <td>103.333.333</td>
                            </tr>
                            <tr>
                                <td>Tháng 6</td>
                                <td>103.333.333</td>
                                <td>3.333.333</td>
                                <td>688.889</td>
                                <td>4.022.222</td>
                                <td>100.000.000</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <a href="#" class="btn btn-outline-primary">TẢI LỊCH TRẢ GÓP CHI TIẾT</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const bankSelect = document.getElementById("bank");
        const interestRateSelect = document.getElementById("interestRate");

        // Danh sách ngân hàng và lãi suất tương ứng
        const bankInterestRates = {
            "Ngân Hàng TMCP Quân Đội (MB BANK) - 7.10 %/năm": "7.1 %",
            "Ngân Hàng TMCP Ngoại Thương Việt Nam (Vietcombank) - 6.90 %/năm":
                "6.9 %",
            "Ngân Hàng TMCP Kỹ Thương Việt Nam (Techcombank) - 7.20 %/năm":
                "7.2 %",
            "Ngân Hàng TMCP Sài Gòn Thương Tín (Sacombank) - 7.00 %/năm": "7.0 %",
            "Ngân Hàng TMCP Công Thương Việt Nam (VietinBank) - 6.80 %/năm":
                "6.8 %",
        };

        // Lắng nghe sự kiện thay đổi của trường "Ngân hàng"
        bankSelect.addEventListener("change", function () {
            const selectedBank = bankSelect.value;
            const interestRate = bankInterestRates[selectedBank];

            // Xóa tất cả các tùy chọn hiện tại trong ô lãi suất
            interestRateSelect.innerHTML = "";

            // Thêm giá trị lãi suất mới
            const option = document.createElement("option");
            option.textContent = interestRate;
            option.value = interestRate;
            interestRateSelect.appendChild(option);
        });
    });
</script>
</body>
</html>
