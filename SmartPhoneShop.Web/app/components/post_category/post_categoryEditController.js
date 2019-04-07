(function (app) {
    app.controller('post_categoryEditController', post_categoryEditController);

    post_categoryEditController.$inject = ['apiService', '$scope', 'notificationService', '$state', '$stateParams', 'commonService'];

    function post_categoryEditController(apiService, $scope, notificationService, $state, $stateParams, commonService) {
        $scope.post_category = {
            CreatedDate: new Date(),
            Status: true
        }
        $scope.GetSeoTitile = GetSeoTitile
        function GetSeoTitile() {
            $scope.post_category.Alias = commonService.getSeoTitle($scope.post_category.Name);
        }
        $scope.UpdatePostCategory = UpdatePostCategory;

        function loadPostCategoryDetail() {
            apiService.get('/api/post_category/getbyid/' + $stateParams.id, null, function (result) {
                $scope.post_category = result.data;
            }, function (error) {
                notificationService.displayError(error.data);
            });
        }

        function UpdatePostCategory() {
            apiService.put('/api/post_category/update', $scope.post_category,
                function (result) {
                    notificationService.displaySuccess(result.data.Name + ' đã được cập nhật.');
                    $state.go('post_category');
                }, function (error) {
                    notificationService.displayError('Cập nhật không thành công.');
                });
        }
        function loadParentCategory() {
            apiService.get('/api/post_category/getallparent', null, function (result) {
                $scope.listPostCategory = result.data;
            }, function () {
                console.log('Cannot get list parent');
            });
        }

        loadParentCategory();
        loadPostCategoryDetail();
    }
})(angular.module('smartphone.post_category'));