(function (app) {
    app.controller('visitor_statisticListController', visitor_statisticListController)
    visitor_statisticListController.$inject = ['$scope', 'apiService']
    function visitor_statisticListController($scope, apiService) {
        
        $scope.visitor_statistic = []
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

        $scope.getVisitor_statistic = getVisitor_statistic;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getVisitor_statistic()
        }
        $scope.change = change
        function change() {
            $scope.getVisitor_statistic()
        }
        function getVisitor_statistic(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/visitor_statistic/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.visitor_statistic = result.data.Items;
            }, function () {
                console.log('Load Visitor_statistic failed.');
            });
        }

        $scope.getVisitor_statistic();
    }
})(angular.module('smartphone.visitor_statistic'))