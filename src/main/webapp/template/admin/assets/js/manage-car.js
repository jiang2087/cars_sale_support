$(function () {


    $('#addBtn').click(function () {
        $('#overlay').show();
        $('#myForm').show();

        $('#form-1').show()
        $('#form-2').hide()
        $('#form-3').hide()
        $('#form-4').hide()
        $('#form-5').hide()
    });

    $('#closeFormBtn').click(function () {
        $('#overlay').hide();
        $('#myForm').hide();
    });

    $('#cancelBtn').click(function () {
        $('#overlay').hide();
        $('#myForm').hide();
    })

    $('#overlay').click(function () {
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

    $('#table-car').DataTable({
        scrollX: true, // Kích hoạt thanh cuộn ngang
        responsive: true, // Đảm bảo bảng tương thích với mọi kích thước màn hình
        searching: false,     // Tắt tìm kiếm
        lengthChange: false,
        language: {
            search: "Tìm kiếm:",
            lengthMenu: "Hiển thị _MENU_ dòng",
            info: "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ dòng",
            paginate: {
                previous: "Trước",
                next: "Sau"
            }
        }
    });

    $('.editBtn').click(function (e) {
        e.preventDefault()
        var data = $(this).data('id');
        console.log(data)
        $.ajax({
            url: '/vinfast/api-cars?id=' + data,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status == "error") {
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: response.message,
                        showConfirmButton: false,
                        timer: 100
                    });
                } else {
                    $('#modelName').val(response.car.modelName);
                    $('#price').val(response.car.price);
                    $('#batteryCapacity').val(response.car.batteryCapacity);
                    $('#rangePerCharge').val(response.car.rangePerCharge);
                    $('#chargingTime').val(response.car.chargingTime);
                    $('#maxPower').val(response.car.maxPower);
                    $('#maxSpeed').val(response.car.maxSpeed);
                    $('#stock').val(response.car.stock);
                    $('#warrantyPeriod').val(response.car.warrantyPeriod);
                    $('#transmission').val(response.car.transmission);
                    $('#energyConsumption').val(response.car.energyConsumption);
                    $('#dimensions').val(response.car.dimensions);
                    $('#wheelBase').val(response.car.wheelBase);
                    $('#weight').val(response.car.weight);
                    $('#torque').val(response.car.torque);
                    $('#drivetrain').val(response.car.drivetrain);

                    $('#hwyAssist').val(response.da.hwyAssist.toString());
                    $('#laneKeepAssist').val(response.da.laneKeepAssist.toString());
                    $('#trafficSignRec').val(response.da.trafficSignRec.toString());
                    $('#driverMon').val(response.da.driverMon.toString());
                    $('#laneCentering').val(response.da.laneCentering.toString());
                    $('#trafficJamAssist').val(response.da.trafficJamAssist.toString());
                    $('#cruise').val(response.da.cruise.toString());
                    $('#adaptiveCruise').val(response.da.adaptiveCruise.toString());
                    $('#speedAdjust').val(response.da.speedAdjust.toString());
                    $('#frontCollWarn').val(response.da.frontCollWarn.toString());
                    $('#frontAutoBrake').val(response.da.frontAutoBrake.toString());
                    $('#rearAutoBrake').val(response.da.rearAutoBrake.toString());
                    $('#intersectionWarn').val(response.da.intersectionWarn.toString());
                    $('#autoLaneKeep').val(response.da.autoLaneKeep.toString());
                    $('#rearCrossWarn').val(response.da.rearCrossWarn.toString());
                    $('#blindSpotWarn').val(response.da.blindSpotWarn.toString());

                    // Gán các giá trị từ JSON vào các input tương ứng
                    $("#seatCount").val(response.inf.seatCount);
                    $("#touchscreenSize").val(response.inf.touchscreenSize);
                    $("#hudDisplay").val(response.inf.hudDisplay);
                    $("#driverSeatConfig").val(response.inf.driverSeatConfig);
                    $("#steeringWheelAdjustment").val(response.inf.steeringWheelAdjustment);
                    $("#steeringWheelType").val(response.inf.steeringWheelType);
                    $("#airConditioningSystem").val(response.inf.airConditioningSystem);
                    $("#usbPorts").val(response.inf.usbPorts);
                    $("#bluetoothWifiConnectivity").val(response.inf.bluetoothWifiConnectivity);
                    $("#soundSystem").val(response.inf.soundSystem);
                    $("#vinFastConnectService").val(response.inf.vinFastConnectService);

                    $("#headlightType").val(response.ef.headlightType);
                    $("#daytimeRunningLight").val(response.ef.daytimeRunningLight);
                    $("#mirrorType").val(response.ef.mirrorType);
                    $("#wiperFunction").val(response.ef.wiperFunction);
                    $("#sunroof").val(response.ef.sunroof);

                    $("#absSystem").val(response.ssf.absSystem.toString());
                    $("#ebdSystem").val(response.ssf.ebdSystem.toString());
                    $("#baSystem").val(response.ssf.baSystem.toString());
                    $("#escSystem").val(response.ssf.escSystem.toString());
                    $("#tcsSystem").val(response.ssf.tcsSystem.toString());
                    $("#hsaSystem").val(response.ssf.hsaSystem.toString());
                    $("#romSystem").val(response.ssf.romSystem.toString());
                    $("#lasSupport").val(response.ssf.lasSupport.toString());
                    $("#autoLockDoor").val(response.ssf.autoLockDoor.toString());
                    $("#airbagSystem").val(response.ssf.airbagSystem.toString());
                    $("#tpmsMonitoring").val(response.ssf.tpmsMonitoring);
                    $("#seatBeltTension").val(response.ssf.seatBeltTension.toString());

                    $('#overlay').show();
                    $('#myForm').show();
                }

            }
            ,
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
            }
        })
    })
    ;

    $('#confirmBtn').click(function () {
        var data = {}
        var formData = $('#form-user').serializeArray()
        var type, btn
        console.log($('#userId').val())
        formData.forEach(item => data[item.name] = item.value)
        if ($('#userId').val() != null && $('#userId').val() !== '') {
            type = 'PUT'
            btn = "Cập nhật"
        } else {
            type = 'POST'
            btn = 'Tạo'
        }
        Swal.fire({
            title: "Bạn có chắc là muốn tạo tài khoản người dùng với thông tin đã nhập không?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: btn,
            denyButtonText: `Hủy`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/vinfast/api-users',
                    type: type,
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire("Đã lưu!", "", response.data);
                        reset()
                        $('#overlay').hide()
                        $('#myForm').hide()
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
            } else if (result.isDenied) {
                Swal.fire("Changes are not saved", "", "info");
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
        $('#accountType').val(response.data.category.categoryId);
        $('#status').val(response.data.brand.brandId);

        $('#image-upload').attr('src', '');
    }
});
