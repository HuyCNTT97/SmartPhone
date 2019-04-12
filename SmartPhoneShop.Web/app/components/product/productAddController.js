(function (app) {
    app.controller('productAddController', productAddController)
    productAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function productAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.product = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy',
            Content: '',
            Promotion: 0,
            ProductCategoryID: 1
        }

        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.product.Alias = commonService.getSeoTitle($scope.product.Name);
        }
        $scope.AddProduct = AddProduct
        function AddProduct() {
            $scope.product.MoreImages = JSON.stringify($scope.moreImages)
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
        $scope.ckeditorOptions = {
            language: 'vi',
            height: '200px'
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.product.Image = fileUrl;
                })
            }
            finder.popup();
        }
        $scope.moreImages = [];

        $scope.ChooseMoreImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.moreImages.push(fileUrl);
                })
            }
            finder.popup();
        }
    }
})(angular.module('smartphone.product'))