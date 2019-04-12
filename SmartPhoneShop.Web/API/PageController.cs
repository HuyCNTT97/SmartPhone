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
    [RoutePrefix("api/page")]
    [Authorize]
    public class PageController : ApiControllerBase
    {
        private IPageService _pageService;

        public PageController(IErrorService errorService, IPageService pageService) :
            base(errorService)
        {
            this._pageService = pageService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listPage = _pageService.GetAll();
                var listPageVM = Mapper.Map<List<PageViewModel>>(listPage);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listPageVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, PageViewModel pageVm)
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
                    Page newPage = new Page();
                    newPage.UpdatePage(pageVm);
                    var category = _pageService.Add(newPage);
                    _pageService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, PageViewModel pageVm)
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
                    var pageDb = _pageService.GetByID(pageVm.ID);
                    pageDb.UpdatePage(pageVm);
                    _pageService.Update(pageDb);
                    _pageService.SaveChanges();

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
                    _pageService.Delete(id);
                    _pageService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}