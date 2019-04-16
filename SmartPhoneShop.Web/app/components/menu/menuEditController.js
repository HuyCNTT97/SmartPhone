(function (app) {
    app.controller('menuEditController', menuEditController);

    menuEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function menuEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.menu = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.menu.Alias = commonService.getSeoTitle($scope.menu.Name);
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
        function loadParentCategory() {
            apiService.get('/api/menu/getallparent', null, function (result) {
                $scope.listMenu = result.data;
            }, function () {
                console.log('Cannot get list parent');
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
        loadParentCategory();
        loadMenuDetail();
    }
})(angular.module('smartphone.menu'));