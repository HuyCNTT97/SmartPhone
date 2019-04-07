/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.menu_group', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('menu_group', {
            url: "/menu_group",
            templateUrl: "/app/components/menu_group/menu_groupListView.html",
            controller: "menu_groupListController"
        }).state('menu_group_add', {
            url: "/menu_group_add",
            templateUrl: "/app/components/menu_group/menu_groupAddView.html",
            controller: "menu_groupAddController"
        })
    }
})();