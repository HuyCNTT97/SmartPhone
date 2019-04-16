(function (app) {
    app.controller('system_configAddController', system_configAddController)
    system_configAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function system_configAddController($scope, apiService, notificationService, $state) {
        $scope.system_config = {
            Status: true
        }

        $scope.AddSystemConfig = AddSystemConfig
        function AddSystemConfig() {
            apiService.post('/api/system_config/add', $scope.system_config, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('system_config')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
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
    }
})(angular.module('smartphone.system_config'))