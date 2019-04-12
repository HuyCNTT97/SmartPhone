(function (app) {
    app.controller('postAddController', postAddController)
    postAddController.$inject = ['$scope', 'apiService', 'notificationService', '$state', 'commonService']
    function postAddController($scope, apiService, notificationService, $state, commonService) {
        $scope.post = {
            CreatedDate: new Date(),
            Status: true,
            CreateBy: 'Huy',
            PostCategoryID: 0
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.post.Alias = commonService.getSeoTitle($scope.post.Name);
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
        $scope.ckeditorOptions = {
            language: 'vi',
            height: '200px'
        }
        $scope.ChooseImage = function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUrl) {
                $scope.$apply(function () {
                    $scope.post.Image = fileUrl;
                })
            }
            finder.popup();
        }
        loadParentCategory()
    }
})(angular.module('smartphone.post'))