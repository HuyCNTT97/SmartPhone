(function (app) {
    app.controller('product_tagListController', product_tagListController)
    product_tagListController.$inject = ['$scope', 'apiService']
    function product_tagListController($scope, apiService) {
        $scope.product_tag = []
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

        $scope.getProductTag = getProductTag;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getProductTag()
        }
        $scope.change = change
        function change() {
            $scope.getProductTag()
        }
        function getProductTag(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/product_tag/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.product_tag = result.data.Items;
            }, function () {
                console.log('Load product_tagcategory failed.');
            });
        }

        $scope.getProductTag();
    }
})(angular.module('smartphone.product_tag'))