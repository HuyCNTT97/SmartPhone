(function (app) {
    app.controller('menu_groupAddController', menu_groupAddController)
    menu_groupAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function menu_groupAddController($scope, apiService, notificationService, $state) {
        $scope.menu_group = {
            Status: true
        }

        $scope.AddMenuGroup = AddMenuGroup
        function AddMenuGroup() {
            apiService.post('/api/menu_group/add', $scope.menu_group, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('menu_group')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.menu_group.Image = fileUrl;
                })
            }
            finder.popup();
        }
    }
})(angular.module('smartphone.menu_group'))