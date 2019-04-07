/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function (app) {
    app.service('apiService', apiService);
    apiService.$inject = ['$http', 'notificationService']
    function apiService($http, notificationService) {
        return {
            get: get,
            post: post
        }
        function get(url, params, successed, failure) {
            $http.get(url, params).then(function (result) {
                successed(result);
            }, function (error) {
                if (error.status == 401) {
                    notificationService.displayError('authenticate is required')
                }
                else {
                    failure(error);
                }
            })
        }
        function post(url, data, success, failure) {
            $http.post(url, data).then(function (result) {
                success(result);
            }, function (error) {
                console.log(error.status)
                if (error.status == 401) {
                    notificationService.displayError('authenticate is required')
                }
                else {
                    failure(error)
                }
            })
        }
    }
})(angular.module('smartphone.common'));