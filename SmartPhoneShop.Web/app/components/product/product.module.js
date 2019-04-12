/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.product', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('product', {
            parent: 'base',
            url: "/product",
            templateUrl: "/app/components/product/productListView.html",
            controller: "productListController"
        }).state('product_add', {
            parent: 'base',
            url: "/product_add",
            templateUrl: "/app/components/product/productAddView.html",
            controller: "productAddController"
        }).state('product_edit', {
            parent: 'base',
            url: "/product_edit/:id",
            templateUrl: "/app/components/product/productEditView.html",
            controller: "productEditController"
        })
    }
})();