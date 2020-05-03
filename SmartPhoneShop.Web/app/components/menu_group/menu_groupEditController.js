(function (app) {
    app.controller('menu_groupEditController', menu_groupEditController);

    menu_groupEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function menu_groupEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.menu_group = {
        }

        $scope.UpdateMenuGroup = UpdateMenuGroup;

        function loadMenuGroupDetail() {
            apiService.get('/api/menu_group/getbyid/' + $stateParams.id, null, function (result) {
                $scope.menu_group = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateMenuGroup() {
            apiService.put('/api/menu_group/update', $scope.menu_group,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('menu_group');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
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
        loadMenuGroupDetail();
    }
})(angular.module('smartphone.menu_group'));