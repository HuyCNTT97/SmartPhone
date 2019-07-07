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
})(angular.module('smartphone.common'))