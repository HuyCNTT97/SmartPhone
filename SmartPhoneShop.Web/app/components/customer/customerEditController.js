(function (app) {
    app.controller('customerEditController', customerEditController);

    customerEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function customerEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.customer = {
        }

        $scope.UpdateCustomer = UpdateCustomer;

        function loadCustomerDetail() {
            apiService.get('/api/customer/getbyid/' + $stateParams.id, null, function (result) {
                $scope.customer = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateCustomer() {
            apiService.put('/api/customer/update', $scope.customer,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('customer');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
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
        loadCustomerDetail();
    }
})(angular.module('smartphone.customer'));