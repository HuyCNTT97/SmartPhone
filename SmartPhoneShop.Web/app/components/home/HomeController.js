(function (app) {
    app.controller('homeController', homeController);
    homeController.$inject = ['apiService']
    function homeController(apiService) {
        apiService.Authorized();
    }
})(angular.module('smartphone'))