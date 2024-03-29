﻿using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.App_Start;
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
    [RoutePrefix("api/order")]
    [Authorize]
    public class OrderController : ApiControllerBase
    {
        private IOrderService _orderService;
        private ApplicationUserManager _user;

        public OrderController(IErrorService errorService, ApplicationUserManager user, IOrderService orderService) :
            base(errorService)
        {
            this._user = user;
            this._orderService = orderService;
        }
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            return CreateHttpResponse(request, () =>
            {
                var model = _orderService.GetByID(id);

                var responseData = Mapper.Map<Order, OrderViewModel>(model);

                var response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }
        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _orderService.GetAll(keyword);
               
                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.ID).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<Order>, IEnumerable<OrderViewModel>>(query);
                foreach (var item in responseData)
                {
                    if(_user.Users.SingleOrDefault(x => x.Id == item.CustomerID) != null) 
                    item.CustomerName = _user.Users.SingleOrDefault(x => x.Id == item.CustomerID).UserName;
                    else item.CustomerName = "Tài khoản đã hủy";
                }
                var paginationSet = new PaginationSet<OrderViewModel>()
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
        public HttpResponseMessage Post(HttpRequestMessage request, OrderViewModel orderVm)
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
                    Order newOrder = new Order();
                    newOrder.UpdateOrder(orderVm);
                    var category = _orderService.Add(newOrder);
                    _orderService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, OrderViewModel orderVm)
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
                    var orderDb = _orderService.GetByID(orderVm.ID);
                    orderDb.UpdateOrder(orderVm);
                    _orderService.Update(orderDb);
                    _orderService.SaveChanges();

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
                    _orderService.Delete(id);
                    _orderService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}