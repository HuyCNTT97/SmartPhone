(function (app) {
    app.controller('productListController', productListController);
    productListController.$inject = ['$scope', 'apiService']
    function productListController($scope, apiService) {
        $scope.product = []
        $scope.page = 0
        $scope.pagesCount = 0

        $scope.getProduct = getProduct;

        function getProduct(page) {
            page = page || 0
            var config = {
                params: {
                    page: page,
                    pageSize: 1,
                }
            }
            apiService.get('/api/product/getall', config, function (result) {
                console.log(result.data)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.product = result.data.Items;
            }, function () {
                console.log('Load productcategory failed.');
            });
        }

        $scope.getProduct();
    }
})(angular.module('smartphone.product'))