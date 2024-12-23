$(function () {
    let blogId = $('#blogId').val();

    // Kiểm tra Cookie
    let viewedArticles = JSON.parse(localStorage.getItem('viewed_articles') || '[]');
    var currentTime = Date.now()

    // Nếu bài viết chưa được xem
    if (!viewedArticles[blogId] || (currentTime - viewedArticles[blogId] > 24 * 60 * 60 * 1000)) {
        $.ajax({
            url: '/vinfast/web/blog/details?id=' + blogId,
            method: 'POST',
            dataType: 'json',
            success: function (response) {
                viewedArticles.push(blogId);
                localStorage.setItem('viewed_articles', JSON.stringify(viewedArticles));
            },
            error: function (xhr, status, error) {
                console.error('Lỗi khi lưu lượt xem:', error);
            }
        });
    } else {
        console.log('Bài viết này đã được xem');
    }

    $('#post-comment').click(function () {
        var data = {}
        var formData = $('#form-comment').serializeArray()
        formData.forEach(item => data[item.name] = item.value)
        console.log(JSON.stringify(data))
        $.ajax({
            url: '/vinfast/api/comments',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (response) {
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
            },
            error: function () {
            }
        })
    })
})