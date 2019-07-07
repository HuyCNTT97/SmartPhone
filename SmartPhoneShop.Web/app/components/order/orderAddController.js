(function (app) {
    app.controller('orderAddController', orderAddController)
    orderAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function orderAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.order = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy'
        }
        apiService.Authorized();
        $scope.required = required
        function required(check, data) {
            if (check == false) {
                notificationService.displayError("bạn phải nhập giá trị ô " + data);
                return true;
            }
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.order.Alias = commonService.getSeoTitle($scope.order.Name);
        }
        $scope.AddOrder = AddOrder
        function AddOrder() {
            apiService.post('/api/order/add', $scope.order, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('order')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/order/getallParent', null, function (result) {
                $scope.listOrder = result.data
                console.log(result.data)
            }, function () {
                console.log("load order parent fail")
            })
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
        loadParentCategory()
    }
})(angular.module('smartphone.order'))