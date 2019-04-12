/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.post', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('post', {
            url: "/post",
            templateUrl: "/app/components/post/postListView.html",
            controller: "postListController",
            parent:'base',
        }).state('post_add', {
            parent:'base',
            url: "/post_add",
            templateUrl: "/app/components/post/postAddView.html",
            controller: "postAddController"
        }).state('post_edit', {
            parent:'base',
            url: "/post_edit/:id",
            templateUrl: "/app/components/post/postEditView.html",
            controller: "postEditController"
        })
    }
})();