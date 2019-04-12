(function (app) {
    app.controller('post_categoryAddController', post_categoryAddController)
    post_categoryAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function post_categoryAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.post_category = {
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
            $scope.post_category.Alias = commonService.getSeoTitle($scope.post_category.Name);
        }
        $scope.AddPostCategory = AddPostCategory
        function AddPostCategory() {
            apiService.post('/api/post_category/add', $scope.post_category, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('post_category')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/post_category/getallParent', null, function (result) {
                $scope.listPostCategory = result.data
                console.log(result.data)
            }, function () {
                console.log("load post_category category parent fail")
            })
        }
        loadParentCategory()
    }
})(angular.module('smartphone.post_category'))