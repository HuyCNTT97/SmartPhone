(function (app) {
    app.controller('price_historyListController', price_historyListController)
    price_historyListController.$inject = ['$scope', 'apiService']
    function price_historyListController($scope, apiService) {
        $scope.price_history = []
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

        $scope.getPrice_history = getPrice_history;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getPrice_history()
        }
        $scope.change = change
        function change() {
            $scope.getPrice_history()
        }
        function getPrice_history(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/price_history/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.price_history = result.data.Items;
            }, function () {
                console.log('Load Price_history failed.');
            });
        }

        $scope.getPrice_history();
    }
})(angular.module('smartphone.price_history'))