(function (app) {
    app.controller('orderEditController', orderEditController);

    orderEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function orderEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.order = {
            CreatedDate: new Date(),
            Status: true
        }
        apiService.Authorized();
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.order.Alias = commonService.getSeoTitle($scope.order.Name);
        }
        $scope.UpdateOrder = UpdateOrder;

        function loadOrderDetail() {
            apiService.get('/api/order/getbyid/' + $stateParams.id, null, function (result) {
                $scope.order = result.data;
                $scope.order.CreateDate = new Date($scope.order.CreateDate)
                console.log($scope.order);
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateOrder() {
            apiService.put('/api/order/update', $scope.order,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('order');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
       
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.order.Image = fileUrl;
                })
            }
            finder.popup();
        }
        
        loadOrderDetail();
    }
})(angular.module('smartphone.order'));