using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
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
    [RoutePrefix("api/visitorStatistic")]
    public class VisitorStatisticController : ApiControllerBase
    {
        private IVisitorStatisticService _visitorStatisticService;

        public VisitorStatisticController(IErrorService errorService, IVisitorStatisticService visitorStatisticService) :
            base(errorService)
        {
            this._visitorStatisticService = visitorStatisticService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listVisitorStatistic = _visitorStatisticService.GetAll();
                var listVisitorStatisticVM = Mapper.Map<List<VisitorStatisticViewModel>>(listVisitorStatistic);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listVisitorStatisticVM);

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