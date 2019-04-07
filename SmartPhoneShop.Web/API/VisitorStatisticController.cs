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
    [RoutePrefix("api/visitor_statistic")]
    public class VisitorStatisticController : ApiControllerBase
    {
        private IVisitorStatisticService _visitorStatisticService;

        public VisitorStatisticController(IErrorService errorService, IVisitorStatisticService visitorStatisticService) :
            base(errorService)
        {
            this._visitorStatisticService = visitorStatisticService;
        }

        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _visitorStatisticService.GetAll(keyword);

                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.ID).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<VisitorStatistic>, IEnumerable<VisitorStatisticViewModel>>(query);

                var paginationSet = new PaginationSet<VisitorStatisticViewModel>()
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
        public HttpResponseMessage Post(HttpRequestMessage request, VisitorStatisticViewModel visitorStatisticVm)
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
                    VisitorStatistic newVisitorStatistic = new VisitorStatistic();
                    newVisitorStatistic.UpdateVisitorStatistic(visitorStatisticVm);
                    var category = _visitorStatisticService.Add(newVisitorStatistic);
                    _visitorStatisticService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, VisitorStatisticViewModel visitorStatisticVm)
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
                    var visitorStatisticDb = _visitorStatisticService.GetByID(visitorStatisticVm.ID);
                    visitorStatisticDb.UpdateVisitorStatistic(visitorStatisticVm);
                    _visitorStatisticService.Update(visitorStatisticDb);
                    _visitorStatisticService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
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
                    _visitorStatisticService.Delete(id);
                    _visitorStatisticService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}