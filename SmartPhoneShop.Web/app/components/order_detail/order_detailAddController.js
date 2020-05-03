(function (app) {
    app.controller('order_detailAddController', order_detailAddController)
    order_detailAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function order_detailAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.order_detail = {
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
            $scope.order_detail.Alias = commonService.getSeoTitle($scope.order_detail.Name);
        }
        $scope.AddOrderDetail = AddOrderDetail
        function AddOrderDetail() {
            apiService.post('/api/order_detail/add', $scope.order_detail, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('order_detail')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/order_detail/getallParent', null, function (result) {
                $scope.listOrderDetail = result.data
                console.log(result.data)
            }, function () {
                console.log("load order_detail parent fail")
            })
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
        loadParentCategory()
    }
})(angular.module('smartphone.order_detail'))