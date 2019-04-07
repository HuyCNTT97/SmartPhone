/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.post_category', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('post_category', {
            url: "/post-category",
            templateUrl: "/app/components/post_category/post_categoryListView.html",
            controller: "post_categoryListController"
        }).state('post_category_add', {
            url: "/post_category_add",
            templateUrl: "/app/components/post_category/post_categoryAddView.html",
            controller: "post_categoryAddController"
        }).state('post_category_edit', {
            url: "/post_category_edit/:id",
            templateUrl: "/app/components/post_category/post_categoryEditView.html",
            controller: "post_categoryEditController"
        })
    }
})();