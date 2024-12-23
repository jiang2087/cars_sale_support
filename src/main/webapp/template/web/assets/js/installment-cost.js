document.addEventListener("DOMContentLoaded", function () {
    const bankSelect = document.getElementById("bank");
    const interestRateSelect = document.getElementById("interestRate");

    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN').format(amount) + ' VNĐ';
    }

    let price
    let time
    let discount
    let nameCar
    let inteRate

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
        inteRate = interestRate
        interestRateSelect.appendChild(option);
        calculator()
    });

    document.getElementById("carModel").addEventListener("change", function () {
        const selectedOption = this.options[this.selectedIndex];
        const carId = selectedOption.value;
        const image = selectedOption.getAttribute("data-image");
        price = selectedOption.getAttribute("data-price");
        nameCar = selectedOption.textContent.trim(); // Lấy nội dung hiển thị
        document.getElementById('image-car').setAttribute('src', "/vinfast/template/uploads/" + image);
        document.getElementById('thRawPrice').textContent = 'Giá xe ' + nameCar; // Thay đổi nội dung của <th>
        document.getElementById('tdRawPrice').innerText = formatCurrency(price)
        calculator()
    })

    const timeBtns = document.querySelectorAll('.timeBtn');

    // Duyệt qua tất cả các nút và gắn sự kiện click
    timeBtns.forEach(function (btn) {
        btn.addEventListener('click', function () {
            time = this.textContent; // Lấy giá trị của nút được chọn

            timeBtns.forEach(function(b) {
                b.classList.remove('btn-primary');
            });
            this.classList.add('btn-primary');
            calculator()
        });
    });

    const discBtns = document.querySelectorAll('.discBtn');

    // Duyệt qua tất cả các nút và gắn sự kiện click
    discBtns.forEach(function (btn) {
        btn.addEventListener('click', function () {
            discount = parseInt(this.textContent);
            discBtns.forEach(function(b) {
                b.classList.remove('btn-primary');
            });
            this.classList.add('btn-primary');
            calculator()
        });

    });

    let interestPrice
    let loanPrice
    function calculator() {
        if (price != null && time != null && discount != null) {
            prePay = (price / 100) * discount
            document.getElementById('tdPrePayment').textContent = formatCurrency(prePay)
            loanPrice = price - prePay
            document.getElementById('tdLoanPrice').textContent = formatCurrency(loanPrice)
            document.getElementById('tdInterestRate').textContent = inteRate
            interestPrice = (loanPrice / 100) * parseInt(inteRate)
            document.getElementById('tdInterestPrice').textContent = formatCurrency(interestPrice)
            total = interestPrice + loanPrice
            document.getElementById('tdTotalPrice').textContent = formatCurrency(total)
        }
    }

    document.getElementById("dis-table").addEventListener("click", function(event) {
        event.preventDefault();
        generateTableRows()
    });

    function generateTableRows() {
        const numMonths = time * 12
        const tbody = document.querySelector('#financeTable tbody');
        tbody.innerHTML = '';

        let initialValue = loanPrice
        let value1, value2, value3, value4, value5;

        // Duyệt qua số lượng tháng cần tạo
        for (let i = 1; i <= numMonths; i++) {
            value2 = Math.floor(initialValue / numMonths);
            value1 = Math.floor(initialValue - (i - 1) * value2);
            value3 = Math.floor(value1 * ((discount / 12) / 100));
            value4 = Math.floor(value2 + value3);
            value5 = Math.floor(value1 - value2);

            // Tạo một dòng (tr) mới
            const row = document.createElement('tr');

            // Thêm các ô (td) cho từng giá trị
            const monthCell = document.createElement('td');
            monthCell.textContent = `Tháng ${i}`;
            row.appendChild(monthCell);

            const value1Cell = document.createElement('td');
            value1Cell.textContent = value1.toLocaleString();
            row.appendChild(value1Cell);

            const value2Cell = document.createElement('td');
            value2Cell.textContent = value2.toLocaleString();
            row.appendChild(value2Cell);

            const value3Cell = document.createElement('td');
            value3Cell.textContent = value3.toLocaleString();
            row.appendChild(value3Cell);

            const value4Cell = document.createElement('td');
            value4Cell.textContent = value4.toLocaleString();
            row.appendChild(value4Cell);

            const value5Cell = document.createElement('td');
            value5Cell.textContent = value5.toLocaleString();
            row.appendChild(value5Cell);

            // Thêm dòng vào tbody
            tbody.appendChild(row);
        }
    }
});