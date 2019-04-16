/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
    angular.module('smartphone.system_config', ['smartphone.common']).config(config);
    config.$inject = ['$stateProvider', '$urlRouterProvider'];
    function config($stateProvider, $urlRouterProvider) {
        $stateProvider.state('system_config', {
            parent: 'base',
            url: "/system_config",
            templateUrl: "/app/components/system_config/system_configListView.html",
            controller: "system_configListController"
        }).state('system_config_add', {
            parent: 'base',
            url: "/system_config_add",
            templateUrl: "/app/components/system_config/system_configAddView.html",
            controller: "system_configAddController"
        }).state('system_config_edit', {
            parent: 'base',
            url: "/system_config_edit/:id",
            templateUrl: "/app/components/system_config/system_configEditView.html",
            controller: "system_configEditController"
        })
    }
})();