(function (app) {
    app.controller('slideAddController', slideAddController)
    slideAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function slideAddController($scope, apiService, notificationService, $state) {
        $scope.slide = {
            Status: true,
            URL:'#'
        }
       
        $scope.AddSlide = AddSlide
        function AddSlide() {
            apiService.post('/api/slide/add', $scope.slide, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('slide')
            }, function (error) {
                notificationService.displayError('Bạn hãy nhập dữ liệu vào các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.slide.Image = fileUrl;
                })
            }
            finder.popup();
        }
    }
})(angular.module('smartphone.slide'))