/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.order', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('order', {
            url: "/order",
            templateUrl: "/app/components/order/orderListView.html",
            controller: "orderListController"
        })/*.state('order_add', {
            url: "/order_add",
            templateUrl: "/app/components/order/orderAddView.html",
            controller: "orderAddController"
        })*/
    }
})();