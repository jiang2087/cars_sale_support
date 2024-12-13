$(function() {


    $('#addBtn').click(function() {
        $('#overlay').show();
        $('#myForm').show();

        $('#form-1').show()
        $('#form-2').hide()
        $('#form-3').hide()
        $('#form-4').hide()
        $('#form-5').hide()
    });

    $('#closeFormBtn').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
    });

    $('#cancelBtn').click(function(){
        $('#overlay').hide();
        $('#myForm').hide();
    })

    $('#overlay').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
    });

    $('#next-form-2').click(function () {
        $('#form-1').hide()
        $('#form-2').show()
    })

    $('#next-form-3').click(function () {
        $('#form-2').hide()
        $('#form-3').show()
    })

    $('#next-form-4').click(function () {
        $('#form-3').hide()
        $('#form-4').show()
    })

    $('#next-form-5').click(function () {
        $('#form-4').hide()
        $('#form-5').show()
    })

    $('#back-form-1').click(function () {
        $('#form-1').show()
        $('#form-2').hide()
    })

    $('#back-form-2').click(function () {
        $('#form-2').show()
        $('#form-3').hide()
    })

    $('#back-form-3').click(function () {
        $('#form-3').show()
        $('#form-4').hide()
    })

    $('#back-form-4').click(function () {
        $('#form-4').show()
        $('#form-5').hide()
    })

    $('.editBtn').click(function(e) {
        e.preventDefault()
        var data = $(this).data('id');

        $.ajax({
            url: '/vinfast/admin-users?id=' + data,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#name').val(response.data.name)
                $('#discount').val(response.data.discount)
                $('#price').val(response.data.price)
                $('#stockQuantity').val(response.data.stockQuantity)
                $('#description').val(response.data.description)
                $('#categorySelect').val(response.data.category.categoryId);
                $('#brandSelect').val(response.data.brand.brandId);

                $('#overlay').show();
                $('#myForm').show();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
            }
        })
    });

    $('#confirmBtn').click(function () {
        var data = {}
        var formData = $('#form-product').serializeArray()
        var type
        formData.forEach(item => data[item.name] = item.value)
        if($('#productId') != null){
            type = 'PUT'
        }else{
            type = 'POST'
        }
        Swal.fire({
            title: "Do you want to save the changes?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Save",
            denyButtonText: `Don't save`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'efashion/admin/products',
                    type: type,
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire("Đã lưu!", "", response.message);
                        $('#overlay').hide()
                        $('#myForm').hide()
                    },
                    error: function (xhr) {
                    }
                })
            } else if (result.isDenied) {
                Swal.fire("Changes are not saved", "", "info");
                $('#overlay').hide()
                $('#myForm').hide()
            }
        });

    })

    $('.deleteBtn').click(function (e) {
        e.preventDefault()
        var id = $(this).data('id')
        Swal.fire({
            title: "Bạn có chắc chắn muốn chặn quyền truy cập của người dùng này không?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Chặn",
            denyButtonText: `Hủy`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/vinfast/manage-users?id=" + id,
                    type: 'DELETE',
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire({
                            title: "Thông báo",
                            text: response.message,
                            icon: "success"
                        });
                    },
                    error: function () {
                    }
                })
            }else if (result.isDenied) {
                Swal.fire("Changes are not saved", "", "info");
                $('#overlay').hide()
                $('#myForm').hide()
            }
        });
    })
});
