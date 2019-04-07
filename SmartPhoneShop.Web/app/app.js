/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone', ['smartphone.product',
        'smartphone.common',
        'smartphone.menu',
        'smartphone.visitor_statistic',
        'smartphone.warranty',
        'smartphone.price_history',
        'smartphone.suppost_online',
        'smartphone.system_config',
        'smartphone.menu_group',
        'smartphone.order_detail',
        'smartphone.order',
        'smartphone.product_category']
        ).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('home', {
            url: '/home',
            templateUrl: "/app/components/home/HomeView.html",
            controller: "homeController"
        })
        $urlRouterProvider.otherwise('/home')
    }
})();