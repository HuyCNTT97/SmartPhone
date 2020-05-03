/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.visitor_statistic', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('visitor_statistic', {
            url: "/visitor_statistic",
            templateUrl: "/app/components/visitor_statistic/visitor_statisticListView.html",
            controller: "visitor_statisticListController"
        }).state('visitor_statistic_add', {
            url: "/visitor_statistic_add",
            templateUrl: "/app/components/product/visitor_statisticAddView.html",
            controller: "visitor_statisticAddController"
        })
    }
})();