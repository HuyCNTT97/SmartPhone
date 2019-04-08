/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.order_detail', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('order_detail', {
            url: "/order_detail",
            templateUrl: "/app/components/order_detail/order_detailListView.html",
            controller: "order_detailListController"
        }).state('order_detail_add', {
            url: "/order_detail_add",
            templateUrl: "/app/components/order_detail/order_detailAddView.html",
            controller: "order_detailAddController"
        })
    }
})();