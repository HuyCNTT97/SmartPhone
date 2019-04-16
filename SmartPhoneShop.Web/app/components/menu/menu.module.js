/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.menu', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('menu', {
            parent: 'base',
            url: "/menu",
            templateUrl: "/app/components/menu/menuListView.html",
            controller: "menuListController"
        }).state('menu_add', {
            parent: 'base',
            url: "/menu_add",
            templateUrl: "/app/components/menu/menuAddView.html",
            controller: "menuAddController"
        }).state('menu_edit', {
            parent: 'base',
            url: "/menu_edit/:id",
            templateUrl: "/app/components/menu/menuEditView.html",
            controller: "menuEditController"
        })
    }
})();