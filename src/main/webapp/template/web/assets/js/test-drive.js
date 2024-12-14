$(function(){
    const cache = {}; // Cache để lưu trữ dữ liệu showroom theo provinceId

    $('#car-model').on('change', function () {
        var selectedOption = $(this).find('option:selected');

        // Lấy giá trị từ thuộc tính data-image
        var imageUrl = selectedOption.data('image');

        // Kiểm tra nếu có URL
        if (imageUrl) {
            // Cập nhật thuộc tính src của thẻ <img>
            $('#image-car').attr('src', '/vinfast/template/uploads/' + imageUrl);
        }
    })

    // Lắng nghe sự kiện thay đổi của tỉnh thành
    $('#province-select').on('change', function () {
        const provinceId = $(this).val(); // Lấy ID tỉnh thành được chọn
        $('#showroom-select').empty(); // Xóa các option cũ
        $('#showroom-select').append('<option value="">-- Đang tải showroom --</option>');

        if (!provinceId) {
            // Nếu không chọn tỉnh thành, hiển thị option mặc định
            $('#showroom-select').empty();
            $('#showroom-select').append('<option value="">-- Chọn showroom --</option>');
            return;
        }

        // Kiểm tra trong cache
        if (cache[provinceId]) {
            // Nếu đã có trong cache, sử dụng dữ liệu từ cache
            populateShowrooms(cache[provinceId]);
        } else {
            // Nếu chưa có trong cache, gửi request đến server
            $.ajax({
                url: '/vinfast/show-room',
                method: 'GET',
                data: { provinceId: provinceId },
                dataType: 'json',
                success: function (response) {
                    cache[provinceId] = response; // Lưu dữ liệu vào cache
                    populateShowrooms(response);
                },
                error: function () {
                    alert('Đã xảy ra lỗi khi tải danh sách showroom!');
                    $('#showroom-select').empty();
                    $('#showroom-select').append('<option value="">Không có showroom</option>');
                }
            });
        }
    });

    // Hàm để thêm dữ liệu showroom vào dropdown
    function populateShowrooms(showrooms) {
        $('#showroom-select').empty();
        if (showrooms && showrooms.length > 0) {
            showrooms.forEach(showroom => {
                $('#showroom-select').append(
                    `<option value="${showroom.showroomId}">${showroom.name}</option>`
                );
            });
        } else {
            $('#showroom-select').append('<option value="">Không có showroom</option>');
        }
    }

    $('#car-model').on('change', function() {
        var selectedOption = $(this).find(":selected");
        var imageUrl = selectedOption.data('image');

        if (imageUrl) {
            $('#car-image').attr('src', imageUrl);
        }
    });

    $('#registration').click(function () {
        var data = {}
        var formData = $('#form-registration').serializeArray()
        formData.forEach(item => data[item.name] = item.value)
        console.log(JSON.stringify(data))
        $.ajax({
            url: '/vinfast/test-drive',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(response) {
                if(response.status === "success"){
                    Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: response.data,
                        showConfirmButton: false,
                        timer: 1000
                    });
                    setTimeout(() => {
                        window.location.href = '/vinfast' + response.url;
                    }, 1000);
                }else{
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: response.message,
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            },
            error: function(xhr) {
                const errorResponse = xhr.responseJSON;
                if (errorResponse && errorResponse.message) {
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: errorResponse.message,
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    console.error("Lỗi không xác định.");
                }
            }
        });
    })
})