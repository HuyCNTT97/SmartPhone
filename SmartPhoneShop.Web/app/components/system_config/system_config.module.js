/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.system_config', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('system_config', {
            url: "/system_config",
            templateUrl: "/app/components/system_config/system_configListView.html",
            controller: "system_configListController"
        }).state('system_config_add', {
            url: "/system_config_add",
            templateUrl: "/app/components/system_config/system_configAddView.html",
            controller: "system_configAddController"
        })
    }
})();