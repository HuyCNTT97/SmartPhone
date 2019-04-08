(function (app) {
    app.controller('suppost_onlineListController', suppost_onlineListController)
    suppost_onlineListController.$inject = ['$scope', 'apiService']
    function suppost_onlineListController($scope, apiService) {
        $scope.suppost_online = []
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

        $scope.getSuppost_online = getSuppost_online;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getSuppost_online()
        }
        $scope.change = change
        function change() {
            $scope.getSuppost_online()
        }
        function getSuppost_online(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/Suppost_online/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.suppost_online = result.data.Items;
            }, function () {
                console.log('Load Suppost_online failed.');
            });
        }

        $scope.getSuppost_online();
    }
})(angular.module('smartphone.suppost_online'))