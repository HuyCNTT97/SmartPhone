/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.order_detail', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('order_detail', {
            parent: 'base',
            url: "/order_detail/:id",
            templateUrl: "/app/components/order_detail/order_detailListView.html",
            controller: "order_detailListController"
        }).state('order_detail_add', {
            parent: 'base',
            url: "/order_detail_add",
            templateUrl: "/app/components/order_detail/order_detailAddView.html",
            controller: "order_detailAddController"
        }).state('order_detail_edit', {
            parent: 'base',
            url: "/order_detail_edit/:id",
            templateUrl: "/app/components/order_detail/order_detailEditView.html",
            controller: "order_detailEditController"
        })
    }
})();