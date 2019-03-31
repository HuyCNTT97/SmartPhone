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
    [RoutePrefix("api/warranty")]
    public class WarrantyController : ApiControllerBase
    {
        private IWarrantyService _warrantyService;

        public WarrantyController(IErrorService errorService, IWarrantyService warrantyService) :
            base(errorService)
        {
            this._warrantyService = warrantyService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listWarranty = _warrantyService.GetAll();
                var listWarrantyVM = Mapper.Map<List<WarrantyViewModel>>(listWarranty);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listWarrantyVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, WarrantyViewModel warrantyVm)
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
                    Warranty newWarranty = new Warranty();
                    newWarranty.UpdateWarranty(warrantyVm);
                    var category = _warrantyService.Add(newWarranty);
                    _warrantyService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, WarrantyViewModel warrantyVm)
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
                    var warrantyDb = _warrantyService.GetByID(warrantyVm.ID);
                    warrantyDb.UpdateWarranty(warrantyVm);
                    _warrantyService.Update(warrantyDb);
                    _warrantyService.SaveChanges();

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
                    _warrantyService.Delete(id);
                    _warrantyService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}