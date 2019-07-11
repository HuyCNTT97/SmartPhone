(function (app) {
    app.filter('statusFilter', function () {
        return function (input) {
            if (input == true) {
                return "Kích Hoạt";
            }
            else {
                return "Đã Khóa";
            }
        }
    })
    app.filter('statusShipFilter', function () {
        return function (input) {
            if (input == true) {
                return "Đã Giao Đủ";
            }
            else {
                return "Chưa Giao Đủ";
            }
        }
    })
    
    app.filter("statusShippingFilter", function () {
       return function (input) {
            if (input == true) {
                return "Đang giao";
            }
            else
                return "Đang chờ xử lí";
        }
    });
    app.filter("statusPaymentFilter", function () {
        return function (input) {
            if (input == true) {
                return "Đã nhận hàng";
            }
            else
                return "Đã thanh toán";
        }
    });
})(angular.module('smartphone.common'))