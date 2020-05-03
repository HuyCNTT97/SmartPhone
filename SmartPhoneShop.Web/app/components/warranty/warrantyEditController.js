(function (app) {
    app.controller('warrantyEditController', warrantyEditController);

    warrantyEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function warrantyEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.warranty = {
        }

        $scope.UpdateWarranty = UpdateWarranty;

        function loadWarrantyDetail() {
            apiService.get('/api/warranty/getbyid/' + $stateParams.id, null, function (result) {
                $scope.warranty = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateWarranty() {
            apiService.put('/api/warranty/update', $scope.warranty,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('warranty');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
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
        loadWarrantyDetail();
    }
})(angular.module('smartphone.warranty'));