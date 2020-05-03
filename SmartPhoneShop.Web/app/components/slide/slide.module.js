/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.slide', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('slide', {
            parent:'base',
            url: "/slide",
            templateUrl: "/app/components/slide/slideListView.html",
            controller: "slideListController"
        }).state('slide_add', {
            parent:'base',
            url: "/slide_add",
            templateUrl: "/app/components/slide/slideAddView.html",
            controller: "slideAddController"
        }).state('slide_edit', {
            parent:'base',
            url: "/slide_edit/:id",
            templateUrl: "/app/components/slide/slideEditView.html",
            controller: "slideEditController"
        })
    }
})();