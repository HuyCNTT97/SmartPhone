(function (app) {
    app.controller('revenueStatisticController', revenueStatisticController);

    revenueStatisticController.$inject = ['$scope', 'apiService', 'notificationService','$filter'];

    function revenueStatisticController($scope, apiService, notificationService,$filter) {
        $scope.tabledata = [];
        $scope.labels = [];
       
        $scope.series = ['Doanh số', 'Lợi nhuận'];
        $scope.fromDate = new Date('01/01/2016')
        $scope.toDate = new Date();
        $scope.chartdata = [];
        
        function getStatistic() {
            var config = {
                param: {
                    //mm/dd/yyyy
                    fromDate: $filter('date')( $scope.fromDate,'dd/MM/yyyy'),
                    toDate: $filter('date')($scope.toDate,'dd/MM/yyyy')
                }
            }
            apiService.get('/api/statistic/getrevenuesstatistic?fromDate=' + config.param.fromDate + "&toDate=" + config.param.toDate, null, function (response) {
                $scope.tabledata = response.data;
                var labels = [];
                var chartData = [];
                var revenues = [];
                var Profits = [];
                $.each(response.data, function (i, item) {
                    labels.push($filter('date')(item.Date,'dd/MM/yyyy'));
                    revenues.push(item.Revenues);
                    Profits.push(item.Profit);
                });
                chartData.push(revenues);
                chartData.push(Profits);
                
                $scope.chartdata = chartData;
                $scope.labels = labels;
            }, function (response) {
                notificationService.displayError('Không thể tải dữ liệu');
            });
        }
        $scope.searchStatistic = function () {
            getStatistic();
        }
        getStatistic();
    }

})(angular.module('smartphone.statistics'));