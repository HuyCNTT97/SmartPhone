﻿/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.product_category', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('product_category', {
            url: "/product_category",
            parent: 'base',
            templateUrl: "/app/components/product_category/product_categoryListView.html",
            controller: "product_categoryListController"
        }).state('product_category_add', {
            url: "/product_category_add",
            parent: 'base',

            templateUrl: "/app/components/product_category/product_categoryAddView.html",
            controller: "product_categoryAddController"
        }).state('product_category_edit', {
            url: '/product_category_edit/:id',
            parent: 'base',

            templateUrl: "/app/components/product_category/product_categoryEditView.html",
            controller: "product_categoryEditController"
        })
    }
})();