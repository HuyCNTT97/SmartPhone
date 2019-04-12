(function (app) {
    app.controller('post_categoryListController', post_categoryListController)
    post_categoryListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox', '$filter']
    function post_categoryListController($scope, apiService, notificationService, $ngBootbox, $filter) {
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
        $scope.selectAll = selectAll;

        $scope.deleteMultiple = deleteMultiple;

        function deleteMultiple() {
            var listId = [];
            $.each($scope.selected, function (i, item) {
                listId.push(item.ID);
            });
            var config = {
                params: {
                    listID: JSON.stringify(listId)
                }
            }
            apiService.del('/api/post_category/deletemulti', config, function (result) {
                notificationService.displaySuccess('Xóa thành công ' + result.data + ' bản ghi.');
                search();
            }, function (error) {
                notificationService.displayError('Xóa không thành công');
            });
        }

        $scope.isAll = false;
        function selectAll() {
            if ($scope.isAll === false) {
                angular.forEach($scope.post_category, function (item) {
                    item.checked = true;
                });
                $scope.isAll = true;
            } else {
                angular.forEach($scope.post_category, function (item) {
                    item.checked = false;
                });
                $scope.isAll = false;
            }
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
        $scope.deletePostCategory = deletePostCategory;
        $scope.$watch("post_category", function (n, o) {
            var checked = $filter("filter")(n, { checked: true });
            if (checked.length) {
                $scope.selected = checked;
                $('#btnDelete').removeAttr('disabled');
            } else {
                $('#btnDelete').attr('disabled', 'disabled');
            }
        }, true);
        function deletePostCategory(id) {
            $ngBootbox.confirm('Bạn có chắc muốn xóa?').then(function () {
                var config = {
                    params:
                         {
                             id: id
                         }
                }
                apiService.del('/api/post_category/delete', config, function () {
                    notificationService.displaySuccess('Xóa thành công');
                    search();
                }, function () {
                    notificationService.displayError('Xóa không thành công');
                })
            });
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