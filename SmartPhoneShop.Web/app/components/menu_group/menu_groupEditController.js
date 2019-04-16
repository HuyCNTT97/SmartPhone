(function (app) {
    app.controller('menuEditController', menuEditController);

    menuEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function menuEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.menu = {
        }

        $scope.UpdateMenu = UpdateMenu;

        function loadMenuDetail() {
            apiService.get('/api/menu/getbyid/' + $stateParams.id, null, function (result) {
                $scope.menu = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateMenu() {
            apiService.put('/api/menu/update', $scope.menu,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('menu');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.menu.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadMenuDetail();
    }
})(angular.module('smartphone.menu'));