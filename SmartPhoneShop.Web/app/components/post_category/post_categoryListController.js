(function (app) {
    app.controller('post_categoryListController', post_categoryListController)
    post_categoryListController.$inject = ['$scope', 'apiService', 'notificationService']
    function post_categoryListController($scope, apiService, notificationService) {
        $scope.post_category = []
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

        $scope.getPost_Category = getPost_Category;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getPost_Category()
        }
        $scope.change = change
        function change() {
            $scope.getPost_Category()
        }
        function getPost_Category(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/post_category/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.post_category = result.data.Items;
            }, function () {
                console.log('Load post_categorycategory failed.');
            });
        }

        $scope.getPost_Category();
    }
})(angular.module('smartphone.post_category'))