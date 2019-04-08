(function (app) {
    app.controller('postListController', postListController)
    postListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox']
    function postListController($scope, apiService, notificationService, $ngBootbox) {
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
        $scope.deletePost = deletePost;
        function deletePost(id) {
            $ngBootbox.confirm('Bạn có chắc muốn xóa?').then(function () {
                var config = {
                    params:
                         {
                             id: id
                         }
                }
                apiService.del('/api/post/delete', config, function () {
                    notificationService.displaySuccess('Xóa thành công');
                    search();
                }, function () {
                    notificationService.displayError('Xóa không thành công');
                })
            });
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
                $scope.CategoryName = result.data.PostName
            }, function () {
                console.log('Load post failed.');
            });
        }

        $scope.getPost();
    }
})(angular.module('smartphone.post'))