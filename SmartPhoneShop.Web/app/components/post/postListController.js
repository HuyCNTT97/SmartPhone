(function (app) {
    app.controller('postListController', postListController)
    postListController.$inject = ['$scope', 'apiService', 'notificationService']
    function postListController($scope, apiService, notificationService) {
        $scope.post = []
        $scope.page = 0
        $scope.pagesCount = 0
        $scope.keyword = ""
        $scope.CategoryName = ""
        $scope.option = {
            options: [{ value: 1, name: "1 dòng" },
            { value: 5, name: "5 dòng" },
            { value: 10, name: "10 dòng" }
            ],
            model: { value: 1, name: "1 dòng" }
        }

        $scope.getPost = getPost;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getPost()
        }
        $scope.change = change
        function change() {
            $scope.getPost()
        }
        function getPost(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/post/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.post = result.data.Items;
                $scope.CategoryName = result.data.PostCategoryName
            }, function () {
                console.log('Load post failed.');
            });
        }

        $scope.getPost();
    }
})(angular.module('smartphone.post'))