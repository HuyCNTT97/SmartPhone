(function (app) {
    app.controller('postEditController', postEditController);

    postEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function postEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.post = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.post.Alias = commonService.getSeoTitle($scope.post.Name);
        }
        $scope.UpdatePost = UpdatePost;

        function loadPostDetail() {
            apiService.get('/api/post/getbyid/' + $stateParams.id, null, function (result) {
                $scope.post = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdatePost() {
            apiService.put('/api/post/update', $scope.post,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('post');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        function loadParentCategory() {
            apiService.get('/api/post_category/getallparent', null, function (result) {
                $scope.listPost = result.data;
            }, function () {
                console.log('Cannot get list parent');
            });
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
        loadParentCategory();
        loadPostDetail();
    }
})(angular.module('smartphone.post'));