/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.price_history', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('price_history', {
            url: "/price_history",
            templateUrl: "/app/components/price_history/price_historyListView.html",
            controller: "price_historyListController"
        }).state('price_history_add', {
            url: "/price_history_add",
            templateUrl: "/app/components/product/price_historyAddView.html",
            controller: "price_historyAddController"
        })
    }
})();