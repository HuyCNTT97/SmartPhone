/// <reference path="../admin/libs/angular/angular.js" />
(function (appClient) {
    appClient.controller("product", product);
    product.$inject = ['$scope'];
    function product($scope) {
        $scope.price = "0";
        $scope.addPrice = addPrice;
        $scope.colorName = "trắng";
        function addPrice(price,colorName) {
            $scope.price = price;
            $scope.colorName = colorName;
        }
    }

})(angular.module("client"));