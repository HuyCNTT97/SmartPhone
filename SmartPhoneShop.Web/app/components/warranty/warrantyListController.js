(function (app) {
    app.controller('warrantyListController', warrantyListController)
    warrantyListController.$inject = ['$scope', 'apiService']
    function warrantyListController($scope, apiService) {
        $scope.warranty = []
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

        $scope.getWarranty = getWarranty;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getWarranty()
        }
        $scope.change = change
        function change() {
            $scope.getWarranty()
        }
        function getWarranty(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/Warranty/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.warranty = result.data.Items;
            }, function () {
                console.log('Load Warranty failed.');
            });
        }

        $scope.getWarranty();
    }
})(angular.module('smartphone.warranty'))