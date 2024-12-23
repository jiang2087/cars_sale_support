$(function () {
    $('#registerBtn').click(function (e) {
        var name = $('#fullName').val()
        var email = $('#email').val()
        var pass = $('#password').val()
        var repass = $('#re-password').val()

        if (name.trim() === "" || email.trim() === "" || pass.trim() === "" || repass.trim() === "") {
            alert("Vui điền đầy dủ thông tin.");
            return false;
        }

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailPattern.test(email)) {
            alert("Vui lòng nhập email hợp lệ.");
            return false;
        }

        if (pass.length < 8) {
            alert("Mật khẩu phải có ít nhất 8 ký tự.");
            return false;
        }

        if (pass !== repass) {
            alert("Mật khẩu và mật khẩu xác nhận không khớp.");
            return false;
        }

        if (!$("#check").is(":checked")) {
            alert("Vui lòng chấp nhận điều khoản dịch vụ của chúng tôi.");
            return false;
        }
        e.preventDefault();
        var data = {}
        var formData = $('#form-register').serializeArray()
        formData.forEach(item => data[item.name] = item.value)
        $.ajax({
            url: '/vinfast/register?action=register',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (response) {
                if(response.status === "success"){
                    Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: response.data,
                        showConfirmButton: false,
                        timer: 1500
                    });
                    setTimeout(() => {
                        window.location.href = '/vinfast/login?action=login';
                    }, 1500);
                }else{
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: response.data,
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            },
            error: function (error) {
                Swal.fire({
                    position: "top-end",
                    icon: "error",
                    title: "Đăng ký thất bại",
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        })
    })
})