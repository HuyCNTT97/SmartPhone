(function (app) {
    app.controller('suppost_onlineEditController', suppost_onlineEditController);

    suppost_onlineEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function suppost_onlineEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.suppost_online = {
        }

        $scope.UpdateSuppostOnline = UpdateSuppostOnline;

        function loadSuppostOnlineDetail() {
            apiService.get('/api/suppost_online/getbyid/' + $stateParams.id, null, function (result) {
                $scope.suppost_online = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateSuppostOnline() {
            apiService.put('/api/suppost_online/update', $scope.suppost_online,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('suppost_online');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.suppost_online.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadSuppostOnlineDetail();
    }
})(angular.module('smartphone.suppost_online'));