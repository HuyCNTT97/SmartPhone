(function (app) {
    app.controller('menuAddController', menuAddController)
    menuAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function menuAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.menu = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy'
        }

        $scope.required = required
        function required(check, data) {
            if (check == false) {
                notificationService.displayError("bạn phải nhập giá trị ô " + data);
                return true;
            }
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.menu.Alias = commonService.getSeoTitle($scope.menu.Name);
        }
        $scope.AddMenu = AddMenu
        function AddMenu() {
            apiService.post('/api/menu/add', $scope.menu, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('menu')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/menu/getallParent', null, function (result) {
                $scope.listMenu = result.data
                console.log(result.data)
            }, function () {
                console.log("load menu parent fail")
            })
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
        loadParentCategory()
    }
})(angular.module('smartphone.menu'))