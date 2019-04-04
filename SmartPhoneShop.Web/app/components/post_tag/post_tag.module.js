/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.post_tag', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('post_tag', {
            url: "/post_tag",
            templateUrl: "/app/components/post_tag/post_tagListView.html",
            controller: "post_tagListController"
        }).state('post_tag_add', {
            url: "/post_tag_add",
            templateUrl: "/app/components/post_tag/post_tagAddView.html",
            controller: "post_tagAddController"
        })
    }
})();