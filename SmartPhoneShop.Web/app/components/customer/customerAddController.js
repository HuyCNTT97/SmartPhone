(function (app) {
    app.controller('customerAddController', customerAddController)
    customerAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function customerAddController($scope, apiService, notificationService, $state) {
        $scope.customer = {
            Status: true
        }

        $scope.AddCustomer = AddCustomer
        function AddCustomer() {
            apiService.post('/api/customer/add', $scope.customer, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('customer')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.customer.Image = fileUrl;
                })
            }
            finder.popup();
        }
    }
})(angular.module('smartphone.customer'))