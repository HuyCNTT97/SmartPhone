(function (app) {
    app.controller('warrantyAddController', warrantyAddController)
    warrantyAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function warrantyAddController($scope, apiService, notificationService, $state) {
        $scope.warranty = {
            Status: true
        }

        $scope.AddWarranty = AddWarranty
        function AddWarranty() {
            apiService.post('/api/warranty/add', $scope.warranty, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('warranty')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.warranty.Image = fileUrl;
                })
            }
            finder.popup();
        }
    }
})(angular.module('smartphone.warranty'))