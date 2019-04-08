/// <reference path="D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Assets/admin/libs/angular/angular.js" />
(function () {
	angular.module('smartphone.menu', ['smartphone.common']).config(config);
	config.$inject = ['$stateProvider', '$urlRouterProvider'];
	function config($stateProvider, $urlRouterProvider) {
		$stateProvider.state('menu', {
			url: "/menu",
			templateUrl: "/app/components/menu/menuListView.html",
			controller: "menuListController"
		}).state('menu_add', {
			url: "/menu_add",
			templateUrl: "/app/components/product/menuAddView.html",
			controller: "menuAddController"
		})
	}
})();