(function (app) {
    app.controller('product_categoryListController', product_categoryListController)
    product_categoryListController.$inject = ['$scope', 'apiService']
    function product_categoryListController($scope, apiService) {
        $scope.productCategory = []
        $scope.getProductCategory = getProductCategory;

        function getProductCategory() {
            apiService.get('/api/productcategory/getall', null, function (result) {
                console.clear()
                console.log(result.data)
                $scope.productCategory = result.data;
            }, function () {
                console.log('Load productcategory failed.');
            });
        }

        $scope.getProductCategory();
    }
})(angular.module('smartphone.product_category'))