using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Infrasture.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace SmartPhoneShop.Web.API
{
    
    [RoutePrefix("api/statistic")]
    public class StatisticController : ApiControllerBase
    {
        IOrderService _orderService;
        public StatisticController(IErrorService errorService,IOrderService orderService) : base(errorService)
        {
            this._orderService = orderService;
        }
        [Route("getrevenuesstatistic")]
        public HttpResponseMessage GetRevenuesStatistic(HttpRequestMessage request,string  fromDate, string toDate)
        {
            return CreateHttpResponse(request, () =>
            {
                var model = _orderService.GetStatisticDates(fromDate,toDate).ToList();
                var response = request.CreateResponse(HttpStatusCode.OK, model);
                return response;
            });
        }
    }
}
