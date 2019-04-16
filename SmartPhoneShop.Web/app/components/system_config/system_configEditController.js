(function (app) {
    app.controller('system_configEditController', system_configEditController);

    system_configEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function system_configEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.system_config = {
        }

        $scope.UpdateSystemConfig = UpdateSystemConfig;

        function loadSystemConfigDetail() {
            apiService.get('/api/system_config/getbyid/' + $stateParams.id, null, function (result) {
                $scope.system_config = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdateSystemConfig() {
            apiService.put('/api/system_config/update', $scope.system_config,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('system_config');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.system_config.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadSystemConfigDetail();
    }
})(angular.module('smartphone.system_config'));