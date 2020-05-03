/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.product_tag', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('product_tag', {
            url: "/product_tag",
            templateUrl: "/app/components/product_tag/product_tagListView.html",
            controller: "product_tagListController"
        }).state('product_tag_add', {
            url: "/product_tag_add",
            templateUrl: "/app/components/product_tag/product_tagAddView.html",
            controller: "product_tagAddController"
        })
    }
})();