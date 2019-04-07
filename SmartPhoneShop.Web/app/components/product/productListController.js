(function (app) {
    app.controller('productListController', productListController)
    productListController.$inject = ['$scope', 'apiService', 'notificationService']
    function productListController($scope, apiService, notificationService) {
        $scope.product = []
        $scope.page = 0
        $scope.pagesCount = 0
        $scope.keyword = ""
        $scope.option = {
            options: [{ value: 1, name: "1 dòng" },
            { value: 5, name: "5 dòng" },
            { value: 10, name: "10 dòng" }
            ],
            model: { value: 1, name: "1 dòng" }
        }

        $scope.getProduct = getProduct;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getProduct()
        }
        $scope.change = change
        function change() {
            $scope.getProduct()
        }
        function getProduct(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/product/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
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