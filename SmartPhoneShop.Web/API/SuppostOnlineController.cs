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
    [RoutePrefix("api/suppostonline")]
    public class SuppostOnlineController : ApiControllerBase
    {
        private ISuppostOnlineService _suppostOnlineService;

        public SuppostOnlineController(IErrorService errorService, ISuppostOnlineService suppostOnlineService) :
            base(errorService)
        {
            this._suppostOnlineService = suppostOnlineService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listSuppostOnline = _suppostOnlineService.GetAll();
                var listSuppostOnlineVM = Mapper.Map<List<SuppostOnlineViewModel>>(listSuppostOnline);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listSuppostOnlineVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, SuppostOnlineViewModel suppostOnlineVm)
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
                    SuppostOnline newSuppostOnline = new SuppostOnline();
                    newSuppostOnline.UpdateSuppostOnline(suppostOnlineVm);
                    var category = _suppostOnlineService.Add(newSuppostOnline);
                    _suppostOnlineService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, SuppostOnlineViewModel suppostOnlineVm)
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
                    var suppostOnlineDb = _suppostOnlineService.GetByID(suppostOnlineVm.ID);
                    suppostOnlineDb.UpdateSuppostOnline(suppostOnlineVm);
                    _suppostOnlineService.Update(suppostOnlineDb);
                    _suppostOnlineService.SaveChanges();

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
                    _suppostOnlineService.Delete(id);
                    _suppostOnlineService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}