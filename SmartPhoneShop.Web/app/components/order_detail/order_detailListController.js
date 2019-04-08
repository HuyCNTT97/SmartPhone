(function (app) {
    app.controller('order_detailListController', order_detailListController)
    order_detailListController.$inject = ['$scope', 'apiService']
    function order_detailListController($scope, apiService) {
        $scope.order_detail = []
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

        $scope.getOrder_detail = getOrder_detail;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getOrder_detail()
        }
        $scope.change = change
        function change() {
            $scope.getOrder_detail()
        }
        function getOrder_detail(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/Order_detail/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.order_detail = result.data.Items;
            }, function () {
                console.log('Load Order_detail failed.');
            });
        }

        $scope.getOrder_detail();
    }
})(angular.module('smartphone.order_detail'))