/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone', ['smartphone.product', 'smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('home', {
            url: "/home",
            templateUrl: "/app/components/home/HomeView.html",
            controller: "homeController"
        })
        $urlRouterProvider.otherwise("/home")
    }
})();