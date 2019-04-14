(function (app) {
    app.controller('productListController', productListController)
    productListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox', '$filter']
    function productListController($scope, apiService, notificationService, $ngBootbox, $filter) {
        $scope.product = []
        $scope.page = 0
        $scope.pagesCount = 0
        $scope.keyword = ""
        $scope.option = {
            options: [{ value: 10, name: "10 dòng" },
            { value: 20, name: "20 dòng" },
            { value: 30, name: "30 dòng" }
            ],
            model: { value: 10, name: "10 dòng" }
        }

        $scope.getProduct = getProduct;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getProduct()
        }
        $scope.change = change
        function change() {
            $scope.getProduct()
        }

        //Delete ở đây
        $scope.deleteProduct = deleteProduct;
        function deleteProduct(id) {
            $ngBootbox.confirm('Bạn có chắc muốn xóa?').then(function () {
                var config = {
                    params:
                         {
                             id: id
                         }
                }
                apiService.del('/api/product/delete', config, function () {
                    notificationService.displaySuccess('Xóa thành công');
                    search();
                }, function () {
                    notificationService.displayError('Xóa không thành công');
                })
            });
        }

        //kết thúc delete
        //Xóa nhiều dòng
        $scope.$watch("product", function (n, o) {
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
            apiService.del('/api/product/deletemulti', config, function (result) {
                notificationService.displaySuccess('Xóa thành công ' + result.data + ' bản ghi.');
                search();
            }, function (error) {
                notificationService.displayError('Xóa không thành công');
            });
        }

        $scope.isAll = false;
        function selectAll() {
            if ($scope.isAll === false) {
                angular.forEach($scope.product, function (item) {
                    item.checked = true;
                });
                $scope.isAll = true;
            } else {
                angular.forEach($scope.product, function (item) {
                    item.checked = false;
                });
                $scope.isAll = false;
            }
        }

        //kết thúc Xóa
        function getProduct(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/product/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('không tìm thấy bảng ghi nào');
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.product = result.data.Items;
            }, function () {
                console.log('Load productcategory failed.');
            });
        }

        $scope.getProduct();
    }
})(angular.module('smartphone.product'))