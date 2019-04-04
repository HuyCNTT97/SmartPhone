(function (app) {
    app.controller('slideListController', slideListController)
    slideListController.$inject = ['$scope', 'apiService']
    function slideListController($scope, apiService) {
        $scope.slide = []
        $scope.page = 0
        $scope.pagesCount = 0
        $scope.keyword = ""
        $scope.option = {
            options: [{ value: 1, name: "1 dòng" },
            { value: 5, name: "5 dòng" },
            { value: 10, name: "10 dòng" }
            ],
            model: { value: 1, name: "1 dòng" }
        }

        $scope.getSlide = getSlide;
        $scope.keyword = ''
        $scope.search = search
        function search() {
            $scope.getSlide()
        }
        $scope.change = change
        function change() {
            $scope.getSlide()
        }
        function getSlide(page) {
            page = page || 0
            var config = {
                params: {
                    keyword: $scope.keyword,
                    page: page,
                    pageSize: $scope.option.model.value,
                }
            }
            apiService.get('/api/slide/getall', config, function (result) {
                console.log(result.data)
                console.log("pageSize:" + $scope.option.model.value)
                $scope.page = result.data.Page;
                $scope.pagesCount = result.data.TotalPages;
                $scope.totalCount = result.data.TotalCount;
                $scope.slide = result.data.Items;
            }, function () {
                console.log('Load slidecategory failed.');
            });
        }

        $scope.getSlide();
    }
})(angular.module('smartphone.slide'))