(function (app) {
    app.controller('product_categoryEditController', product_categoryEditController);

    product_categoryEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function product_categoryEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.product_category = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.product_category.Alias = commonService.getSeoTitle($scope.product_category.Name);
        }
        $scope.UpdateProductCategory = UpdateProductCategory;

        function loadProductCategoryDetail() {
            apiService.get('/api/product_category/getbyid/' + $stateParams.id, null, function (result) {
                $scope.product_category = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateProductCategory() {
            apiService.put('/api/product_category/update', $scope.product_category,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('product_category');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        function loadParentCategory() {
            apiService.get('/api/product_category/getallparent', null, function (result) {
                $scope.listProductCategory = result.data;
            }, function () {
                console.log('Cannot get list parent');
            });
        }

        loadParentCategory();
        loadProductCategoryDetail();
    }
})(angular.module('smartphone.product_category'));