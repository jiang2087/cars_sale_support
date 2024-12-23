$('#updateProfileBtn').click(function () {
    var data = {}
    var formData = $('#form-updateProfile').serializeArray()
    formData.forEach(item => data[item.name] = item.value)
    $.ajax({
        url: '/vinfast/admin-profile?action=updpr',
        type: "POST",
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (response) {
            alert("success")
        },
        error: function (xhr, status, error) {
            alert("lỗi rồi");
        }
    })
})

$('#changePasswordBtn').click(function () {
    var data = {}
    var formData = $('#form-changePassword').serializeArray()
    formData.forEach(item => data[item.name] = item.value)
    $.ajax({
        url: '/vinfast/admin-profile?action=updprP',
        type: "POST",
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (response) {
            if(response.status == "success"){
                alert("Thay đổi thành công")
            }else if(response.status == "recheck"){
                alert("Hãy kiểm tra lại mật khẩu nhập có đúng không")
            }else{
                alert("Hãy nhập mật khẩu đúng")
            }
        },
        error: function (xhr, status, error) {
            alert(error);
        }
    })
})