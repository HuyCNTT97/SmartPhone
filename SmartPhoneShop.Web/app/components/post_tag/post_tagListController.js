(function (app) {
    app.controller('post_tagListController', post_tagListController)
    post_tagListController.$inject = ['$scope', 'apiService', 'notificationService']
    function post_tagListController($scope, apiService, notificationService) {
        $scope.post_tag = []
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

        $scope.getPostTag = getPostTag;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getPostTag()
        }
        $scope.change = change
        function change() {
            $scope.getPostTag()
        }
        function getPostTag(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/post_tag/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.post_tag = result.data.Items;
            }, function () {
                console.log('Load post_tagcategory failed.');
            });
        }

        $scope.getPostTag();
    }
})(angular.module('smartphone.post_tag'))