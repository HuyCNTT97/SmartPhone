(function (app) {
    app.controller('system_configListController', system_configListController)
    system_configListController.$inject = ['$scope', 'apiService']
    function system_configListController($scope, apiService) {
        $scope.system_config = []
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

        $scope.getSystem_config = getSystem_config;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getSystem_config()
        }
        $scope.change = change
        function change() {
            $scope.getSystem_config()
        }
        function getSystem_config(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/System_config/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.system_config = result.data.Items;
            }, function () {
                console.log('Load System_config failed.');
            });
        }

        $scope.getSystem_config();
    }
})(angular.module('smartphone.system_config'))