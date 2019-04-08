/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.suppost_online', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('suppost_online', {
            url: "/suppost_online",
            templateUrl: "/app/components/suppost_online/suppost_onlineListView.html",
            controller: "suppost_onlineListController"
        }).state('suppost_online_add', {
            url: "/suppost_online_add",
            templateUrl: "/app/components/suppost_online/suppost_onlineAddView.html",
            controller: "suppost_onlineAddController"
        })
    }
})();