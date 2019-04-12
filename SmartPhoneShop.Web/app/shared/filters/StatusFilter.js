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
})(angular.module('smartphone.common'))