/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function (app) {
    app.service('apiService', apiService);
    apiService.$inject = ['$http']
    function apiService($http) {
        return {
            get: get
        }
        function get(url, params, successed, failure) {
            $http.get(url, params).then(function (result) {
                successed(result);
            }, function (error) {
                failure(error);
            })
        }
    }
})(angular.module('smartphone.common'));