$(function(){
    const provinces = [
        { id: 1, name: "Hà Nội" },
        { id: 2, name: "TP Hồ Chí Minh" },
        { id: 3, name: "Đà Nẵng" }
    ];

    // Gán tỉnh thành vào select
    provinces.forEach(province => {
        $('#province-select').append(`<option value="${province.id}">${province.name}</option>`);
    });

    // Bước 2: Xử lý khi người dùng chọn tỉnh
    $('#province-select').change(function () {
        const provinceId = $(this).val();

        // Reset showroom mỗi lần chọn tỉnh mới
        $('#showroom-select').html('<option value="">Chọn showroom</option>');

        if (provinceId) {
            // Gửi request lấy danh sách showroom theo tỉnh
            $.get(`/showrooms?provinceId=${provinceId}`, function (data) {
                // Gán showroom vào select
                data.forEach(showroom => {
                    $('#showroom-select').append(`<option value="${showroom.id}">${showroom.name}</option>`);
                });
            });
        }
    });
})