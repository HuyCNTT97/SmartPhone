using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Infrastructure.Core;
using SmartPhoneShop.Web.Infrasture.Core;
using SmartPhoneShop.Web.Infrasture.Extension;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SmartPhoneShop.Web.API
{
    [RoutePrefix("api/price_history")] 
    public class PriceHistoryController : ApiControllerBase
    {
        private IPriceHistoryService _priceHistoryService;

        public PriceHistoryController(IErrorService errorService, IPriceHistoryService priceHistoryService) :
            base(errorService)
        {
            this._priceHistoryService = priceHistoryService;
        }

        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _priceHistoryService.GetAll(keyword);

                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.ProductID).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<PriceHistory>, IEnumerable<PriceHistoryViewModel>>(query);

                var paginationSet = new PaginationSet<PriceHistoryViewModel>()
                {
                    Items = responseData,
                    Page = page,
                    TotalCount = totalRow,
                    TotalPages = (int)Math.Ceiling((decimal)totalRow / pageSize)
                };
                var response = request.CreateResponse(HttpStatusCode.OK, paginationSet);
                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, PriceHistoryViewModel priceHistoryVm)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    PriceHistory newPriceHistory = new PriceHistory();
                    newPriceHistory.UpdatePriceHistory(priceHistoryVm);
                    var category = _priceHistoryService.Add(newPriceHistory);
                    _priceHistoryService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    _priceHistoryService.Delete(id);
                    _priceHistoryService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}