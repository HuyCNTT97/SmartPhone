(function (app) {
    app.controller('productEditController', productEditController);

    productEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function productEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.product = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.moreImages = [];

        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.product.Alias = commonService.getSeoTitle($scope.product.Name);
        }
        $scope.UpdateProduct = UpdateProduct;

        function loadProductDetail() {
            apiService.get('/api/product/getbyid/' + $stateParams.id, null, function (result) {
                $scope.product = result.data;
                $scope.moreImages = JSON.parse($scope.product.MoreImages)
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateProduct() {
            $scope.product.MoreImages = JSON.stringify($scope.moreImages)
            apiService.put('/api/product/update', $scope.product,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('product');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        function loadParentCategory() {
            apiService.get('/api/product/getallparent', null, function (result) {
                $scope.listProduct = result.data;
            }, function () {
                console.log('Cannot get list parent');
            });
        }
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
        $scope.ChooseMoreImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.moreImages.push(fileUrl);
                })
            }
            finder.popup();
        }
        $scope.DeleteOneImage = DeleteOneImage
        function DeleteOneImage(image) {
            var index = $scope.moreImages.indexOf(image);
            $scope.moreImages.splice(index, 1);
        }
        $scope.DeleteMoreImage = DeleteMoreImage
        function DeleteMoreImage() {
            $scope.moreImages = [];
        }
        loadParentCategory();
        loadProductDetail();
    }
})(angular.module('smartphone.product'));