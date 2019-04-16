(function (app) {
    app.controller('order_detailEditController', order_detailEditController);

    order_detailEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function order_detailEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.order_detail = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.order_detail.Alias = commonService.getSeoTitle($scope.order_detail.Name);
        }
        $scope.UpdateOrderDetail = UpdateOrderDetail;

        function loadOrderDetailDetail() {
            apiService.get('/api/order_detail/getbyid/' + $stateParams.id, null, function (result) {
                $scope.order_detail = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateOrderDetail() {
            apiService.put('/api/order_detail/update', $scope.order_detail,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('order_detail');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        function loadParentCategory() {
            apiService.get('/api/order_detail/getallparent', null, function (result) {
                $scope.listOrderDetail = result.data;
            }, function () {
                console.log('Cannot get list parent');
            });
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.order_detail.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadParentCategory();
        loadOrderDetailDetail();
    }
})(angular.module('smartphone.order_detail'));