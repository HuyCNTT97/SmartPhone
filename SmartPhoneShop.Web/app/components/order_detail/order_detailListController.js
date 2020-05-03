(function (app) {
    app.controller('order_detailListController', order_detailListController)
    order_detailListController.$inject = ['$scope', 'apiService', 'notificationService', '$ngBootbox', '$filter','$stateParams']
    function order_detailListController($scope, apiService, notificationService, $ngBootbox, $filter, $stateParams) {
        $scope.order_detail = []
        $scope.page = 0
        $scope.shipping = false;
        $scope.payment = false;
        $scope.pagesCount = 0
        if ($stateParams.id === undefined)
            $scope.keyword = ""
        else $scope.keyword = $stateParams.id;
        apiService.Authorized();
       
        $scope.option = {
            options: [{ value: 10, name: "10 dòng" },
            { value: 20, name: "20 dòng" },
            { value: 30, name: "30 dòng" }
            ],
            model: { value: 30, name: "30 dòng" }
        }

        $scope.getOrder_detail = getOrder_detail;
        $scope.search = search
        function search() {
            $scope.getOrder_detail()
        }

        $scope.change = change
        function change() {
            $scope.getOrder_detail()
        }
        $scope.deleteOrder_detail = deleteOrder_detail;
        function deleteOrder_detail(id) {
            $ngBootbox.confirm('Bạn có chắc muốn xóa?').then(function () {
                var config = {
                    params:
                    {
                        id: id
                    }
                }
                apiService.del('/api/order_detail/delete', config, function () {
                    notificationService.displaySuccess('Xóa thành công');
                    search();
                }, function () {
                    notificationService.displayError('Xóa không thành công');
                })
            });
        }

        //Xóa nhiều dòng
        $scope.$watch("order_detail", function (n, o) {
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
            apiService.del('/api/orderDetail/deletemulti', config, function (result) {
                notificationService.displaySuccess('Xóa thành công ' + result.data + ' bản ghi.');
                search();
            }, function (error) {
                notificationService.displayError('Xóa không thành công');
            });
        }

        $scope.isAll = false;
        function selectAll() {
            if ($scope.isAll === false) {
                angular.forEach($scope.order_detail, function (item) {
                    item.checked = true;
                });
                $scope.isAll = true;
            } else {
                angular.forEach($scope.order_detail, function (item) {
                    item.checked = false;
                });
                $scope.isAll = false;
            }
        }

        //kết thúc Xóa
        function getOrder_detail(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/orderDetail/getall', config, function (result) {
                if (result.data.TotalCount == 0) {
                    notificationService.displayWarning('Không có bản ghi nào được tìm thấy')
                }
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.order_detail = result.data.Items;
            }, function () {
                console.log('Load order_detail failed.');
            });
        }
        //change status shipping and payment
        $scope.CommitShip = function (OrderID,productID) {
            var config = {
                params: {
                    id: OrderID,
                    productID: productID
                }
            }
            apiService.get('/api/orderDetail/changeShipping', config, function (result) {
                
                if (result.data == true) {
                    $scope.order_detail.forEach(function (item, index) {
                        if (item.ProductID == productID && item.OrderID == OrderID) {
                            item.Shipping=true
                        }
                    })
                    notificationService.displaySuccess("Đã chuyển sang trạng thái đang giao")

                }
                else
                    console.log(result)
            }, function () {
                notificationService.displayWarning("Hành động thất bại");
               })
        }
        $scope.Refund = function (OrderID, productID) {
            var config = {
                params: {
                    id: OrderID,
                    productID: productID
                }
            }
            apiService.get('/api/orderDetail/refund', config, function (result) {

                if (result.data == true) {
                    $scope.order_detail.forEach(function (item, index) {
                        if (item.OrderID == OrderID && item.ProductID == productID) {
                            item.Shipping = false;
                            item.Payment = false;
                        }
                    })
                    notificationService.displaySuccess("Trả hàng lại vào kho thành công");
                }
                else
                    console.log(result)
            }, function () {
                notificationService.displayWarning("Hành động thất bại");
            })
        }
        $scope.CommitPayment = function (OrderID, productID) {
            var config = {
                params: {
                    id: OrderID,
                    productID: productID
                }
            }
            apiService.get('/api/orderDetail/changePayment', config, function (result) {
                if (result.data) {
                    $scope.order_detail.forEach(function (item, index) {
                        if (item.OrderID == OrderID && item.ProductID == productID) {
                           item.Payment=true
                        } 
                    })
                    notificationService.displaySuccess("Đã xác nhận trạng thái nhận hàng")

                }
                else console.log(result)
            }, function () {
                notificationService.displayWarning("Hành động thất bại");
            })
        }
        $scope.getOrder_detail();
    }
})(angular.module('smartphone.order_detail'))