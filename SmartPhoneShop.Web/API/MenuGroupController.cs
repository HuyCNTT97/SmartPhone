﻿using AutoMapper;
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
    [RoutePrefix("api/menu_group")]
    [Authorize]
    public class MenuGroupController : ApiControllerBase
    {
        private IMenuGroupService _menuGroupService;

        public MenuGroupController(IErrorService errorService, IMenuGroupService menuGroupService) :
            base(errorService)
        {
            this._menuGroupService = menuGroupService;
        }

        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _menuGroupService.GetAll(keyword);
                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.Name).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<MenuGroup>, IEnumerable<MenuGroupViewModel>>(query);

                var paginationSet = new PaginationSet<MenuGroupViewModel>()
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