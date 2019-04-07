(function (app) {
    app.controller('postAddController', postAddController)
    postAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state']
    function postAddController($scope, apiService, notificationService, $state) {
        $scope.post = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy',
            PostCategoryID: 1
        }
        $scope.required = required
        function required(check, data) {
            if (check == false) {
                notificationService.displayError("bạn phải nhập giá trị ô " + data);
                return true;
            }
        }
        $scope.AddPost = AddPost
        function AddPost() {
            apiService.post('/api/post/add', $scope.post, function (result) {
                notificationService.displaySuccess(result.data.Name + ' Đã được thêm thành công')
                $state.go('post')
            }, function (error) {
                notificationService.displayError('Bạn phải nhập dữ liệu cho các ô bắt buộc')

                notificationService.displayError('Thêm không thành công')
            })
        }
        function loadParentCategory() {
            apiService.get('/api/post_category/getallParent', null, function (result) {
                $scope.listPost = result.data
                console.log(result.data)
            }, function () {
                console.log("load product category parent fail")
            })
        }
        loadParentCategory()
    }
})(angular.module('smartphone.post'))