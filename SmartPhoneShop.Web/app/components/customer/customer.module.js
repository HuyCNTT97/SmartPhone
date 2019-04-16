/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.customer', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('customer', {
            parent:'base',
            url: "/customer",
            templateUrl: "/app/components/customer/customerListView.html",
            controller: "customerListController"
        }).state('customer_add', {
            parent:'base',
            url: "/customer_add",
            templateUrl: "/app/components/customer/customerAddView.html",
            controller: "customerAddController"
        }).state('customer_edit', {
            parent:'base',
            url: "/customer_edit/:id",
            templateUrl: "/app/components/customer/customerEditView.html",
            controller: "customerEditController"
        })
    }
})();