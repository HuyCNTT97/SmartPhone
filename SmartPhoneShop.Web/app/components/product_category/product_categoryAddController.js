(function (app) {
    app.controller('product_categoryAddController', product_categoryAddController)
    product_categoryAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function product_categoryAddController($scope, apiService, notificationService, $state) {
        $scope.product_category = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy'
        }

        $scope.required = required
        function required(check, data) {
            if (check == false) {
                notificationService.displayError("bạn phải nhập giá trị ô " + data);
                return true;
            }
        }
        $scope.AddProductCategory = AddProductCategory
        function AddProductCategory() {
            apiService.post('/api/product_category/add', $scope.product_category, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('product_category')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/product_category/getallParent', null, function (result) {
                $scope.listProductCategory = result.data
                console.log(result.data)
            }, function () {
                console.log("load product category parent fail")
            })
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.product_category.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadParentCategory()
    }
})(angular.module('smartphone.product_category'))