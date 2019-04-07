(function (app) {
    app.controller('menu_groupListController', menu_groupListController)
    menu_groupListController.$inject = ['$scope', 'apiService']
    function menu_groupListController($scope, apiService) {
        $scope.menu_group = []
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

        $scope.getMenu_group = getMenu_group;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getMenu_group()
        }
        $scope.change = change
        function change() {
            $scope.getMenu_group()
        }
        function getMenu_group(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/menu_group/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.menu_group = result.data.Items;
            }, function () {
                console.log('Load Menu_group failed.');
            });
        }

        $scope.getMenu_group();
    }
})(angular.module('smartphone.menu_group'))