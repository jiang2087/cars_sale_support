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
<section id="main-installment-cost">
    <div id="over-flay">
        <div class="container">
            <div class="form-title">
                <img
                        src="images/logo-vinfast.png"
                        alt="VinFast Logo"
                        class="vinfast-logo"
                />
                <h1>Dự toán chi phí trả góp</h1>
                <p>
                    Các giá trị dự toán này chỉ mang tính chất tham khảo. Để nhận thông
                    tin cụ thể và chính xác, quý khách vui lòng liên hệ với showroom hoặc
                    đại lý gần nhất.
                </p>
            </div>
            <form>
                <div class="mb-3">
                    <label for="carModel" class="form-label">Mẫu xe</label>
                    <select class="form-select" id="carModel">
                        <option selected value="">Lựa chọn</option>
                        <option value="A">Mẫu A</option>
                        <option value="B">Mẫu B</option>
                        <option value="C">Mẫu C</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="carVersion" class="form-label">Phiên bản</label>
                    <select class="form-select" id="carVersion">
                        <option selected value="">Lựa chọn</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="battery" class="form-label">Pin</label>
                    <select class="form-select" id="battery">
                        <option selected>Lựa chọn</option>
                        <option selected>Bao gồm Pin</option>
                        <option selected>Không bao gồm Pin</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="loanPackage" class="form-label">Gói vay</label>
                    <select class="form-select" id="loanPackage">
                        <option selected>Lựa chọn</option>
                        <option selected>Vay thông thường</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Thời gian vay</label>
                    <div class="d-flex gap-2">
                        <button type="button" class="btn btn-outline-secondary">1</button>
                        <button type="button" class="btn btn-outline-secondary">2</button>
                        <button type="button" class="btn btn-outline-secondary">3</button>
                        <button type="button" class="btn btn-outline-secondary">4</button>
                        <button type="button" class="btn btn-outline-secondary">5</button>
                        <button type="button" class="btn btn-outline-secondary">6</button>
                        <button type="button" class="btn btn-outline-secondary">7</button>
                        <button type="button" class="btn btn-outline-secondary">8</button>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Số tiền trả trước</label>
                    <div class="d-flex gap-2">
                        <button type="button" class="btn btn-outline-secondary">20%</button>
                        <button type="button" class="btn btn-outline-secondary">30%</button>
                        <button type="button" class="btn btn-outline-secondary">40%</button>
                        <button type="button" class="btn btn-outline-secondary">50%</button>
                        <button type="button" class="btn btn-outline-secondary">60%</button>
                        <button type="button" class="btn btn-outline-secondary">70%</button>
                        <button type="button" class="btn btn-outline-secondary">80%</button>
                        <button type="button" class="btn btn-outline-secondary">90%</button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="bank" class="form-label">Ngân hàng</label>
                    <select class="form-select" id="bank">
                        <option selected>
                            Ngân Hàng TMCP Quân Đội (MB BANK) - 7.10 %/năm
                        </option>
                        <option>
                            Ngân Hàng TMCP Ngoại Thương Việt Nam (Vietcombank) - 6.90 %/năm
                        </option>
                        <option>
                            Ngân Hàng TMCP Kỹ Thương Việt Nam (Techcombank) - 7.20 %/năm
                        </option>
                        <option>
                            Ngân Hàng TMCP Sài Gòn Thương Tín (Sacombank) - 7.00 %/năm
                        </option>
                        <option>
                            Ngân Hàng TMCP Công Thương Việt Nam (VietinBank) - 6.80 %/năm
                        </option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="interestRate" class="form-label">Lãi suất</label>
                    <select class="form-select" id="interestRate">
                        <option selected>7.1 %</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">
                    Lịch Trả Góp Chi Tiết
                </button>
            </form>
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
