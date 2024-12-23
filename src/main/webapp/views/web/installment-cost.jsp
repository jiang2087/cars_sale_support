<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 13/12/2024
  Time: 12:38 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section id="main-installment-car">
    <div id="over-flay">
        <div class="pb-5 pe-5">
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
                    <div class="text-center mb-4" style="width: 80%; height: auto; margin-left: 10%">
                        <img src="${pageContext.request.contextPath}/template/general/img/logo-xl.png" alt="Car Image" class="img-fluid" id="image-car">
                    </div>
                    <!-- Thông tin xe và chi tiết khoản vay -->
                    <table class="table table-borderless">
                        <tbody>
                        <tr>
                            <th scope="row" class="text-muted" id="thRawPrice">Giá xe VF 3</th>
                            <td class="text-end fw-bold" id="tdRawPrice">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted" id="thPrePayment">Trả trước</th>
                            <td class="text-end" id="tdPrePayment">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted" id="thLoanPrice">Số tiền vay</th>
                            <td class="text-end fw-bold" id="tdLoanPrice">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted" id="thInterestRate">Lãi suất (%/năm)</th>
                            <td class="text-end" id="tdInterestRate">0 %</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted">Số tiền lãi</th>
                            <td class="text-end" id="tdInterestPrice">0 VNĐ</td>
                        </tr>
                        <tr>
                            <th scope="row" class="text-muted fw-bold">Tổng tiền Vay & Lãi</th>
                            <td class="text-end text-primary fw-bold fs-5" id="tdTotalPrice">0 VNĐ</td>
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
                                <select class="form-select" id="carModel" name="carId" required>
                                    <option selected disabled>Chọn mẫu xe</option>
                                    <c:forEach var="item" items="${cars}">
                                        <option value="${item.carId}" data-image="${item.mainUrlImage}" data-price="${item.price}">
                                                ${item.modelName}
                                        </option>
                                    </c:forEach>
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
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">1</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">2</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">3</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">4</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">5</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">6</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">7</button>
                                    <button type="button" class="timeBtn btn btn-outline-secondary btn-sm">8</button>
                                </div>
                            </div>

                            <!-- Down Payment -->
                            <div class="mb-3">
                                <label class="form-label">Số tiền trả trước</label>
                                <div class="d-flex gap-2 flex-wrap">
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">20%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">30%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">40%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">50%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">60%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">70%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">80%</button>
                                    <button type="button" class="discBtn btn btn-outline-secondary btn-sm">90%</button>
                                </div>
                            </div>

                            <!-- Bank -->
                            <div class="mb-3">
                                <label for="bank" class="form-label">Ngân hàng</label>
                                <select class="form-select" id="bank">
                                    <option value="Ngân Hàng TMCP Quân Đội (MB BANK) - 7.10 %/năm">Ngân Hàng TMCP Quân Đội (MB BANK) - 7.10 %/năm</option>
                                    <option value="Ngân Hàng TMCP Ngoại Thương Việt Nam (Vietcombank) - 6.90 %/năm">Ngân Hàng TMCP Ngoại Thương Việt Nam (Vietcombank) - 6.90 %/năm</option>
                                    <option value="Ngân Hàng TMCP Kỹ Thương Việt Nam (Techcombank) - 7.20 %/năm">Ngân Hàng TMCP Kỹ Thương Việt Nam (Techcombank) - 7.20 %/năm</option>
                                    <option value="Ngân Hàng TMCP Sài Gòn Thương Tín (Sacombank) - 7.00 %/năm">Ngân Hàng TMCP Sài Gòn Thương Tín (Sacombank) - 7.00 %/năm</option>
                                    <option value="Ngân Hàng TMCP Công Thương Việt Nam (VietinBank) - 6.80 %/năm">Ngân Hàng TMCP Công Thương Việt Nam (VietinBank) - 6.80 %/năm</option>
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
                                <button type="button" class="btn btn-dark w-100" data-bs-toggle="modal" data-bs-target="#paymentScheduleModal" id="dis-table">
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
                        <table class="table table-striped text-center align-middle" id="financeTable">
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
<script src="${pageContext.request.contextPath}/template/web/assets/js/installment-cost.js"></script>
</body>
</html>
