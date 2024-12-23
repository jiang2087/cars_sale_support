$(function() {
    $('#addBtn').click(function() {
        $('#overlay').show();
        $('#myForm').show();
    });

    $('#closeFormBtn').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
        reset()
    });

    $('#cancelBtn').click(function(){
        $('#overlay').hide();
        $('#myForm').hide();
        reset()
    })

    $('#overlay').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
        reset()
    });

    const table = $('#table-test-drive').DataTable({
        scrollX: true,
        responsive: true,
        language: {
            info: "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ dòng",
            paginate: {
                previous: "Trước",
                next: "Sau",
            },
        },
        dom: 'rtip',
        pageLength: 5,
    });

    $('#search').on('keyup', function () {
        table.search(this.value).draw();
    });

    $('#selectOp').on('change', function () {
        const limit = parseInt(this.value, 10);
        table.page.len(limit).draw(); // Gọi hàm thay đổi số dòng hiển thị của DataTables
    });

    $('.confirmBtn').click(function(e) {
        e.preventDefault()
        var data = $(this).data('id');
        $('#testId').val(data)
        $('#overlay').show();
        $('#myForm').show();
    });

    $('#confirmBtn').click(async function () {
        var id = $('#testId').val()
        var time = $('#testDate').val()
        Swal.fire({
            title: "Xác nhận lại thông tin??",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Xác nhận",
            denyButtonText: `Thoát`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/vinfast/api/test-drive?id='+id+'&time='+time,
                    type: 'PUT',
                    dataType: 'json',
                    success: function (response) {
                        if(response.status === "success"){
                            Swal.fire({
                                title: "Thành công",
                                text: response.data,
                                icon: "success"
                            });
                        }else if(response.status === "error"){
                            Swal.fire({
                                title: "Thất bại",
                                text: response.data,
                                icon: "error"
                            });
                        }
                        setTimeout(() => {
                            $('#overlay').hide()
                            $('#myForm').hide()
                            window.location.href = '/vinfast/admin/manage?action=test-drive'
                        }, 1000);
                    },
                    error: function (xhr) {
                    }
                })
            } else if (result.isDenied) {
                Swal.fire("Đã hủy thao tác!", "", "info");
                $('#overlay').hide()
                $('#myForm').hide()
                reset()
            }
        });
    })

    $('.cancelBtn').click(function (e) {
        e.preventDefault()
        var id = $(this).data('id')
        Swal.fire({
            title: "Bạn có chắc chắn muốn hủy lịch đăng ký lái thử của khách hàng này không?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Hủy lịch",
            denyButtonText: `Thoát`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/vinfast/api/test-drive?id=" + id,
                    type: 'DELETE',
                    dataType: 'json',
                    success: function (response) {
                        if(response.status === "success"){
                            Swal.fire({
                                title: "Thành công",
                                text: response.data,
                                icon: "success"
                            });
                        }else{
                            Swal.fire({
                                title: "Thất bại",
                                text: response.data,
                                icon: "error"
                            });
                        }
                        setTimeout(() => {
                            window.location.href = '/vinfast/admin/manage?action=test-drive'
                        }, 1000);
                    },
                    error: function () {
                    }
                })
            }else if (result.isDenied) {
                Swal.fire("Đã thoát", "", "info");
                $('#overlay').hide()
                $('#myForm').hide()
            }
        });
    })

    function reset() {
        $('#userId').val("")
        $('#fullName').val("")
        $('#email').val("")
        $('#phoneNumber').val("")
        $('#address').val("")
        $('#role').val("")

        $('#image-upload').attr('src', '');
    }
});
