(function (app) {
    app.controller('orderListController', orderListController)
    orderListController.$inject = ['$scope', 'apiService']
    function orderListController($scope, apiService) {
        $scope.order = []
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

        $scope.getOrder = getOrder;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getOrder()
        }
        $scope.change = change
        function change() {
            $scope.getOrder()
        }
        function getOrder(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/Order/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.order = result.data.Items;
            }, function () {
                console.log('Load Order failed.');
            });
        }

        $scope.getOrder();
    }
})(angular.module('smartphone.order'))