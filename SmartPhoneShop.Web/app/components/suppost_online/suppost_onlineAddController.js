(function (app) {
    app.controller('suppost_onlineAddController', suppost_onlineAddController)
    suppost_onlineAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function suppost_onlineAddController($scope, apiService, notificationService, $state) {
        $scope.suppost_online = {
            Status: true
        }

        $scope.AddSuppostOnline = AddSuppostOnline
        function AddSuppostOnline() {
            apiService.post('/api/suppost_online/add', $scope.suppost_online, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('suppost_online')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
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
    }
})(angular.module('smartphone.suppost_online'))