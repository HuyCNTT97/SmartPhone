/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.warranty', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('warranty', {
            url: "/warranty",
            templateUrl: "/app/components/warranty/warrantyListView.html",
            controller: "warrantyListController"
        }).state('warranty_add', {
            url: "/warranty_add",
            templateUrl: "/app/components/warranty/warrantyAddView.html",
            controller: "warrantyAddController"
        })
    }
})();