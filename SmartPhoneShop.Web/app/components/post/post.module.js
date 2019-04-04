/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.post', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('post', {
            url: "/post",
            templateUrl: "/app/components/post/postListView.html",
            controller: "postListController"
        }).state('post_add', {
            url: "/post_add",
            templateUrl: "/app/components/post/postAddView.html",
            controller: "postAddController"
        })
    }
})();