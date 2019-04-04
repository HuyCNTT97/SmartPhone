/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.tag', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('tag', {
            url: "/tag",
            templateUrl: "/app/components/tag/tagListView.html",
            controller: "tagListController"
        }).state('tag_add', {
            url: "/tag_add",
            templateUrl: "/app/components/tag/tagAddView.html",
            controller: "tagAddController"
        })
    }
})();