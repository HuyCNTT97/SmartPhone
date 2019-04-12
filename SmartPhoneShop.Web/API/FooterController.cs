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
    [RoutePrefix("api/footer")]
    [Authorize]
    public class FooterController : ApiControllerBase
    {
        private IFooterService _footerService;

        public FooterController(IErrorService errorService, IFooterService footerService) :
            base(errorService)
        {
            this._footerService = footerService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listFooter = _footerService.GetAll();
                var listFooterVM = Mapper.Map<List<FooterViewModel>>(listFooter);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listFooterVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, FooterViewModel footerVm)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    Footer newFooter = new Footer();
                    newFooter.UpdateFooter(footerVm);
                    var category = _footerService.Add(newFooter);
                    _footerService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, FooterViewModel footerVm)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    var footerDb = _footerService.GetByID(footerVm.ID);
                    footerDb.UpdateFooter(footerVm);
                    _footerService.Update(footerDb);
                    _footerService.SaveChanges();

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
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    _footerService.Delete(id);
                    _footerService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}