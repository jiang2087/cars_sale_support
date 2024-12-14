$(function() {
    $(".nav-item").on("click", function (e) {
        e.preventDefault();
        const targetId = $(this).data("bs-target");

        // Đóng tất cả các accordion trước
        $(".accordion-collapse").each(function () {
            const collapse = new bootstrap.Collapse(this, {toggle: false});
            collapse.hide();
        });

        // Mở accordion tương ứng
        const targetCollapse = $(targetId)[0];
        const collapse = new bootstrap.Collapse(targetCollapse, {
            toggle: true,
        });

        // Thêm class active vào mục đã chọn
        $(".nav-item").removeClass("active");
        $(this).addClass("active");
    });

    $('#overlay').hide();
    $('#myForm').hide();
    $('#car-info').hide();
    $('#car-info1').hide();

    $('.card').on('click', function() {
        $('#overlay').show();
        $('#myForm').show();
    });

    $(document).on('change', '.single-check', function () {
        if ($(this).is(':checked')) {
            $('.single-check').not(this).prop('checked', false); // Bỏ chọn các checkbox khác
        }
    });

    $('#choose').click(function () {
        const selectedCar = $('.single-check:checked').val(); // Lấy giá trị của checkbox được chọn
        if (selectedCar) {
            console.log('Xe được chọn: ' + selectedCar);
            $.ajax({
                url: '/vinfast/api-cars?id=' + selectedCar,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    console.log($('#Dimensions').text() === null || $('#Dimensions').text() === "")
                    if ($('#Dimensions').text() === null || $('#Dimensions').text() === "") {
                        $('#model-name').text(response.car.modelName)
                        $('#car-price').text(response.car.price)
                        $('#image-upload').attr('src', '/vinfast/template/uploads/' + response.car.mainUrlImage);

                        $('#Dimensions').text(response.car.dimensions);
                        $('#WheelBase').text(response.car.wheelBase);
                        $('#MaxPower').text(response.car.maxPower);
                        $('#Torque').text(response.car.torque);
                        $('#Drivetrain').text(response.car.drivetrain);
                        $('#Transmission').text(response.car.transmission);
                        $('#WarrantyPeriod').text(response.car.warrantyPeriod);
                        $('#Stock').text(response.car.stock);
                        $('#RangePerCharge').text(response.car.rangePerCharge);

                        // Các giá trị trong EF (Features)
                        $('#HeadlightType').text(response.ef.headlightType);
                        $('#DaytimeRunningLight').text(response.ef.daytimeRunningLight);
                        $('#MirrorType').text(response.ef.mirrorType);
                        $('#WiperFunction').text(response.ef.wiperFunction);
                        $('#Sunroof').text(response.ef.sunroof);

                        // Các giá trị trong Inf (Interior)
                        $('#SeatCount').text(response.inf.seatCount);
                        $('#TouchscreenSize').text(response.inf.touchscreenSize);
                        $('#HudDisplay').text(response.inf.hudDisplay ? 'Có' : 'Không');
                        $('#DriverSeatConfig').text(response.inf.driverSeatConfig);
                        $('#PassengerSeatConfig').text(response.inf.passengerSeatConfig);
                        $('#SteeringWheelAdjustment').text(response.inf.steeringWheelAdjustment);
                        $('#SteeringWheelType').text(response.inf.steeringWheelType);
                        $('#AirConditioningSystem').text(response.inf.airConditioningSystem);
                        $('#UsbPorts').text(response.inf.usbPorts);
                        $('#BluetoothWifiConnectivity').text(response.inf.bluetoothWifiConnectivity ? 'Có' : 'Không');
                        $('#SoundSystem').text(response.inf.soundSystem);
                        $('#VinFastConnectService').text(response.inf.vinFastConnectService ? 'Có' : 'Không');

                        // Các giá trị trong SSF (Safety Features)
                        $('#AbsSystem').text(response.ssf.absSystem ? 'Có' : 'Không');
                        $('#EbdSystem').text(response.ssf.ebdSystem ? 'Có' : 'Không');
                        $('#BaSystem').text(response.ssf.baSystem ? 'Có' : 'Không');
                        $('#EscSystem').text(response.ssf.escSystem ? 'Có' : 'Không');
                        $('#TcsSystem').text(response.ssf.tcsSystem ? 'Có' : 'Không');
                        $('#HsaSystem').text(response.ssf.hsaSystem ? 'Có' : 'Không');
                        $('#RomSystem').text(response.ssf.romSystem ? 'Có' : 'Không');
                        $('#LasSuppor').text(response.ssf.lasSupport ? 'Có' : 'Không');
                        $('#AutoLockDoor').text(response.ssf.autoLockDoor ? 'Có' : 'Không');
                        $('#AirbagSystem').text(response.ssf.airbagSystem ? 'Có' : 'Không');
                        $('#TpmsMonitoring').text(response.ssf.tpmsMonitoring ? 'Có' : 'Không');
                        $('#SeatBeltTension').text(response.ssf.seatBeltTension ? 'Có' : 'Không');

                        // Các giá trị trong DA (Driver Assistance)
                        $('#HwyAssist').text(response.da.hwyAssist ? 'Có' : 'Không');
                        $('#LaneKeepAssist').text(response.da.laneKeepAssist ? 'Có' : 'Không');
                        $('#TrafficSignRec').text(response.da.trafficSignRec ? 'Có' : 'Không');
                        $('#DriverMon').text(response.da.driverMon ? 'Có' : 'Không');
                        $('#LaneCentering').text(response.da.laneCentering ? 'Có' : 'Không');
                        $('#TrafficJamAssist').text(response.da.trafficJamAssist ? 'Có' : 'Không');
                        $('#Cruise').text(response.da.cruise ? 'Có' : 'Không');
                        $('#AdaptiveCruise').text(response.da.adaptiveCruise ? 'Có' : 'Không');
                        $('#SpeedAdjust').text(response.da.speedAdjust ? 'Có' : 'Không');
                        $('#FrontCollWarn').text(response.da.frontCollWarn ? 'Có' : 'Không');
                        $('#FrontAutoBrake').text(response.da.frontAutoBrake ? 'Có' : 'Không');
                        $('#RearAutoBrake').text(response.da.rearAutoBrake ? 'Có' : 'Không');
                        $('#IntersectionWarn').text(response.da.intersectionWarn ? 'Có' : 'Không');
                        $('#AutoLaneKeep').text(response.da.autoLaneKeep ? 'Có' : 'Không');
                        $('#RearCrossWarn').text(response.da.rearCrossWarn ? 'Có' : 'Không');

                        $('#car-info').show();
                        $('#car-choose').hide();
                    } else {
                        // Cập nhật các giá trị từ response.car
                        $('#Dimensions1').text(response.car.dimensions);
                        $('#WheelBase1').text(response.car.wheelBase);
                        $('#MaxPower1').text(response.car.maxPower);
                        $('#Torque1').text(response.car.torque);
                        $('#Drivetrain1').text(response.car.drivetrain);
                        $('#Transmission1').text(response.car.transmission);
                        $('#WarrantyPeriod1').text(response.car.warrantyPeriod);
                        $('#Stock1').text(response.car.stock);
                        $('#RangePerCharge1').text(response.car.rangePerCharge);

                        // Cập nhật các giá trị boolean trong response.ef
                        $('#HeadlightType1').text(response.ef.headlightType);
                        $('#DaytimeRunningLight1').text(response.ef.daytimeRunningLight);
                        $('#MirrorType1').text(response.ef.mirrorType);
                        $('#WiperFunction1').text(response.ef.wiperFunction);
                        $('#Sunroof1').text(response.ef.sunroof);

                        // Cập nhật các giá trị trong response.inf
                        $('#SeatCount1').text(response.inf.seatCount);
                        $('#TouchscreenSize1').text(response.inf.touchscreenSize);
                        $('#HudDisplay1').text(response.inf.hudDisplay ? "Có" : "Không");
                        $('#DriverSeatConfig1').text(response.inf.driverSeatConfig);
                        $('#PassengerSeatConfig1').text(response.inf.passengerSeatConfig);
                        $('#SteeringWheelAdjustment1').text(response.inf.steeringWheelAdjustment);
                        $('#SteeringWheelType1').text(response.inf.steeringWheelType);
                        $('#AirConditioningSystem1').text(response.inf.airConditioningSystem);
                        $('#UsbPorts1').text(response.inf.usbPorts);
                        $('#BluetoothWifiConnectivity1').text(response.inf.bluetoothWifiConnectivity ? "Có" : "Không");
                        $('#SoundSystem1').text(response.inf.soundSystem);
                        $('#VinFastConnectService1').text(response.inf.vinFastConnectService ? "Có" : "Không");

                        // Cập nhật các hệ thống an toàn trong response.ssf
                        $('#AbsSystem1').text(response.ssf.absSystem ? "Có" : "Không");
                        $('#EbdSystem1').text(response.ssf.ebdSystem ? "Có" : "Không");
                        $('#BaSystem1').text(response.ssf.eBasystem ? "Có" : "Không");
                        $('#EscSystem1').text(response.ssf.escSystem ? "Có" : "Không");
                        $('#TcsSystem1').text(response.ssf.tcsSystem ? "Có" : "Không");
                        $('#HsaSystem1').text(response.ssf.hsaSystem ? "Có" : "Không");
                        $('#RomSystem1').text(response.ssf.romSystem ? "Có" : "Không");
                        $('#LasSuppor1').text(response.ssf.lasSuppor ? "Có" : "Không");
                        $('#AutoLockDoor1').text(response.ssf.autoLockDoor ? "Có" : "Không");
                        $('#AirbagSystem1').text(response.ssf.airbagSystem ? "Có" : "Không");
                        $('#TpmsMonitoring1').text(response.ssf.tpmsMonitoring ? "Có" : "Không");
                        $('#SeatBeltTension1').text(response.ssf.seatBeltTension ? "Có" : "Không");

                        // Cập nhật các tính năng Driver Assist trong response.da
                        $('#HwyAssist1').text(response.da.hwyAssist ? "Có" : "Không");
                        $('#LaneKeepAssist1').text(response.da.laneKeepAssist ? "Có" : "Không");
                        $('#TrafficSignRec1').text(response.da.trafficSignRec ? "Có" : "Không");
                        $('#DriverMon1').text(response.da.driverMon ? "Có" : "Không");
                        $('#LaneCentering1').text(response.da.laneCentering ? "Có" : "Không");
                        $('#TrafficJamAssist1').text(response.da.trafficJamAssist ? "Có" : "Không");
                        $('#Cruise1').text(response.da.Cruise ? "Có" : "Không");
                        $('#AdaptiveCruise1').text(response.da.adaptiveCruise ? "Có" : "Không");
                        $('#SpeedAdjust1').text(response.da.speedAdjust ? "Có" : "Không");
                        $('#FrontCollWarn1').text(response.da.FrontCollWarn ? "Có" : "Không");
                        $('#FrontAutoBrake1').text(response.da.FrontAutoBrake ? "Có" : "Không");
                        $('#RearAutoBrake1').text(response.da.rearAutoBrake ? "Có" : "Không");
                        $('#IntersectionWarn1').text(response.da.IntersectionWarn ? "Có" : "Không");
                        $('#AutoLaneKeep1').text(response.da.autoLaneKeep ? "Có" : "Không");
                        $('#RearCrossWarn1').text(response.da.rearCrossWarn ? "Có" : "Không");


                        $('#car-info1').show();
                        $('#car-choose1').hide();
                    }
                    $('#overlay').hide();
                    $('#myForm').hide();
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                    alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
                }
            })
        } else {
            alert('Vui lòng chọn một phiên bản xe.');
        }
    });


})