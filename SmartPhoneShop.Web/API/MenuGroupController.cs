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
    [RoutePrefix("api/menugroup")]
    public class MenuGroupController : ApiControllerBase
    {
        private IMenuGroupService _menuGroupService;

        public MenuGroupController(IErrorService errorService, IMenuGroupService menuGroupService) :
            base(errorService)
        {
            this._menuGroupService = menuGroupService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listMenuGroup = _menuGroupService.GetAll();
                var listMenuGroupVM = Mapper.Map<List<MenuGroupViewModel>>(listMenuGroup);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listMenuGroupVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, MenuGroupViewModel menuGroupVm)
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
                    MenuGroup newMenuGroup = new MenuGroup();
                    newMenuGroup.UpdateMenuGroup(menuGroupVm);
                    var category = _menuGroupService.Add(newMenuGroup);
                    _menuGroupService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, MenuGroupViewModel menuGroupVm)
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
                    var menuGroupDb = _menuGroupService.GetByID(menuGroupVm.ID);
                    menuGroupDb.UpdateMenuGroup(menuGroupVm);
                    _menuGroupService.Update(menuGroupDb);
                    _menuGroupService.SaveChanges();

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
                    _menuGroupService.Delete(id);
                    _menuGroupService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}