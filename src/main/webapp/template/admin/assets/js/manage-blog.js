$(function() {
    var quill = new Quill('#description-blog', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'font': [] }, { 'size': [] }],
                [ 'bold', 'italic', 'underline', 'strike' ],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'script': 'super' }, { 'script': 'sub' }],
                [{ 'header': '1' }, { 'header': '2' }, {'header': '3'}, 'blockquote', 'code-block' ],
                [{ 'list': 'ordered' }, { 'list': 'bullet'}, { 'indent': '-1' }, { 'indent': '+1' }],
                [ 'direction', { 'align': [] }],
                [ 'link', 'image', 'video', 'formula' ],
                [ 'clean' ]
            ]
        }
    });

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

    const table = $('#table-user').DataTable({
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
        table.page.len(limit).draw();
    });

    $('#file-upload').on('change', function (event) {
        var imgElement = $('#uploadImage');
        imgElement.attr('src', URL.createObjectURL(event.target.files[0]));
        imgElement.css('width', '100%');
    });

    $('.editBtn').click(function(e) {
        e.preventDefault()
        var data = $(this).data('id');
        $.ajax({
            url: '/vinfast/api-users?id=' + data,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if(response.status == "error"){
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: response.message,
                        showConfirmButton: false,
                        timer: 100
                    });
                }else{
                    $('#userId').val(response.data.userId)
                    $('#fullName').val(response.data.fullName)
                    $('#email').val(response.data.email)
                    $('#phoneNumber').val(response.data.phoneNumber)
                    $('#address').val(response.data.address)
                    $('#role').val(response.data.role)
                    $('#accountType').val(response.data.accountType);
                    $('#status').val(response.data.status);
                    $('#image-upload').attr('src', '/vinfast/template/uploads/' + response.data.avatar);

                    $('#overlay').show();
                    $('#myForm').show();
                }

            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
            }
        })
    });

    $('#confirmBtn').click(async function () {
        var htmlContent = quill.root.innerHTML;

        var data = {}
        console.log(JSON.stringify(data))
        var formData = $('#form-blog').serializeArray()
        var type, btn
        formData.forEach(item => data[item.name] = item.value)
        data['content'] = htmlContent
        if($('#blogId').val() != null && $('#blogId').val() !== ''){
            type = 'PUT'
            btn = "Cập nhật"
        }else{
            type = 'POST'
            btn = 'Tạo'
        }
        Swal.fire({
            title: "Bạn có chắc là muốn tạo tài khoản người dùng với thông tin đã nhập không?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: btn,
            denyButtonText: `Hủy`
        }).then(async (result) => {
            if (result.isConfirmed) {
                await saveImage(data);
                console.log(JSON.stringify(data))
                $.ajax({
                    url: '/vinfast/api-blogs',
                    type: type,
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire("Đã lưu!", "", response.data);
                        $('#overlay').hide()
                        $('#myForm').hide()
                        window.location.href = '/vinfast/admin-users'
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

    function reset() {
        // $('#userId').val("")
        // $('#fullName').val("")
        // $('#email').val("")
        // $('#phoneNumber').val("")
        // $('#address').val("")
        // $('#role').val("")
        // $('#accountType').val(response.data.category.categoryId);
        // $('#status').val(response.data.brand.brandId);
        //
        // $('#image-upload').attr('src', '');
    }

    async function saveImage(data) {
        var formDt = new FormData();
        var fileInput = $('#file-upload')[0].files[0];
        if(fileInput){
            formDt.append('file', fileInput);
        }
        try {
            const response = await fetch('/vinfast/api-blogs', {
                method: 'PATCH',
                body: formDt
            });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            const respond = await response.json();

            data["thumbnail"] = respond.fileName;

        } catch (error) {
            alert('Có lỗi xảy ra:' + error);
        }
    }

});
