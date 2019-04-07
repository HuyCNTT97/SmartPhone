(function (app) {
    app.controller('productAddController', productAddController)
    productAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function productAddController($scope, apiService, notificationService, $state) {
        $scope.product = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy',
            Content: '',
            Promotion: 0,
            ProductCategoryID: 1
        }

        $scope.AddProduct = AddProduct
        function AddProduct() {
            apiService.post('/api/product/add', $scope.product, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('product')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/product_category/getallParent', null, function (result) {
                $scope.listProduct = result.data
                console.log(result.data)
            }, function () {
                console.log("load product parent fail")
            })
        }
        loadParentCategory()
    }
})(angular.module('smartphone.product'))