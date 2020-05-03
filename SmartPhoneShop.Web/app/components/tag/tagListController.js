(function (app) {
    app.controller('tagListController', tagListController)
    tagListController.$inject = ['$scope', 'apiService', 'notificationService']
    function tagListController($scope, apiService, notificationService) {
        $scope.tag = []
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

        $scope.getTag = getTag;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getTag()
        }
        $scope.change = change
        function change() {
            $scope.getTag()
        }
        function getTag(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/tag/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.tag = result.data.Items;
            }, function () {
                console.log('Load tagcategory failed.');
            });
        }

        $scope.getTag();
    }
})(angular.module('smartphone.tag'))