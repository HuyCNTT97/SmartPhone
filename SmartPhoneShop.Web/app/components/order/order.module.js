/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.order', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('order', {
            parent: 'base',
            url: "/order",
            templateUrl: "/app/components/order/orderListView.html",
            controller: "orderListController"
        }).state('order_add', {
            parent: 'base',
            url: "/order_add",
            templateUrl: "/app/components/order/orderAddView.html",
            controller: "orderAddController"
        }).state('order_edit', {
            parent: 'base',
            url: "/order_edit/:id",
            templateUrl: "/app/components/order/orderEditView.html",
            controller: "orderEditController"
        })
    }
})();