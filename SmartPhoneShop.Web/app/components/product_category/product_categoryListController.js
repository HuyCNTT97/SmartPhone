(function (app) {
    app.controller('product_categoryListController', product_categoryListController)
    product_categoryListController.$inject = ['$scope', 'apiService']
    function product_categoryListController($scope, apiService) {
        $scope.productCategory = []
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

        $scope.getProductCategory = getProductCategory;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getProductCategory()
        }
        $scope.change = change
        function change() {
            $scope.getProductCategory()
        }
        function getProductCategory(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/productcategory/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.productCategory = result.data.Items;
            }, function () {
                console.log('Load productcategory failed.');
            });
        }

        $scope.getProductCategory();
    }
})(angular.module('smartphone.product_category'))