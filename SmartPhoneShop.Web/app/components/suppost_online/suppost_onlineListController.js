(function (app) {
    app.controller('suppost_onlineListController', suppost_onlineListController)
    suppost_onlineListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox', '$filter']
    function suppost_onlineListController($scope, apiService, notificationService, $ngBootbox, $filter) {
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
        $scope.deleteSuppostOnline = deleteSuppostOnline;
        function deleteSuppostOnline(id) {
            $ngBootbox.confirm('Bạn có chắc muốn xóa?').then(function () {
                var config = {
                    params:
                    {
                        id: id
                    }
                }
                apiService.del('/api/suppost_online/delete', config, function () {
                    notificationService.displaySuccess('Xóa thành công');
                    search();
                }, function () {
                    notificationService.displayError('Xóa không thành công');
                })
            });
        }

        //Xóa nhiều dòng
        $scope.$watch("suppost_online", function (n, o) {
            var checked = $filter("filter")(n, { checked: true });
            if (checked.length) {
                $scope.selected = checked;
                $('#btnDelete').removeAttr('disabled');
            } else {
                $('#btnDelete').attr('disabled', 'disabled');
            }
        }, true);
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
            apiService.del('/api/suppost_online/deletemulti', config, function (result) {
                notificationService.displaySuccess('Xóa thành công ' + result.data + ' bản ghi.');
                search();
            }, function (error) {
                notificationService.displayError('Xóa không thành công');
            });
        }

        $scope.isAll = false;
        function selectAll() {
            if ($scope.isAll === false) {
                angular.forEach($scope.suppost_online, function (item) {
                    item.checked = true;
                });
                $scope.isAll = true;
            } else {
                angular.forEach($scope.suppost_online, function (item) {
                    item.checked = false;
                });
                $scope.isAll = false;
            }
        }

        //kết thúc Xóa
        function getSuppost_online(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/suppost_online/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayError('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.suppost_online = result.data.Items;
            }, function () {
                console.log('Load suppost_onlinecategory failed.');
            });
        }

        $scope.getSuppost_online();
    }
})(angular.module('smartphone.suppost_online'))