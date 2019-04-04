/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.slide', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('slide', {
            url: "/slide",
            templateUrl: "/app/components/slide/slideListView.html",
            controller: "slideListController"
        }).state('slide_add', {
            url: "/slide_add",
            templateUrl: "/app/components/slide/slideAddView.html",
            controller: "slideAddController"
        })
    }
})();