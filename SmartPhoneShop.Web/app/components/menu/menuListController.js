(function (app) {
    app.controller('menuListController', menuListController)
    menuListController.$inject = ['$scope', 'apiService']
    function menuListController($scope, apiService) {
        $scope.menu = []
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

        $scope.getMenu = getMenu;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getMenu()
        }
        $scope.change = change
        function change() {
            $scope.getMenu()
        }
        function getMenu(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/menu/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.menu = result.data.Items;
            }, function () {
                console.log('Load Menu failed.');
            });
        }

        $scope.getMenu();
    }
})(angular.module('smartphone.menu'))