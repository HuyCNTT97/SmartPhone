(function (app) {
    app.controller('rootController', rootController);

    rootController.$inject = ['$state', 'authData', 'loginService', '$scope','apiService'];

    function rootController($state, authData, loginService, $scope, apiService) {
        $scope.logOut = function () {
            loginService.logOut();
            $state.go('login');
        }
        $scope.authentication = authData.authenticationData;
        
        $scope.sideBar = "/app/shared/views/sideBar.html";
        apiService.Authorized()
        
        
    }
})(angular.module('smartphone'));