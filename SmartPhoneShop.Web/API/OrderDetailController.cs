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
    [RoutePrefix("api/orderdetail")]
    public class OrderDetailController : ApiControllerBase
    {
        private IOrderDetailService _orderDetailService;

        public OrderDetailController(IErrorService errorService, IOrderDetailService orderDetailService) :
            base(errorService)
        {
            this._orderDetailService = orderDetailService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listOrderDetail = _orderDetailService.GetAll();
                var listOrderDetailVM = Mapper.Map<List<OrderDetailViewModel>>(listOrderDetail);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listOrderDetailVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, OrderDetailViewModel orderDetailVm)
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
                    OrderDetail newOrderDetail = new OrderDetail();
                    newOrderDetail.UpdateOrderDetail(orderDetailVm);
                    var category = _orderDetailService.Add(newOrderDetail);
                    _orderDetailService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, OrderDetailViewModel orderDetailVm)
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
                    var orderDetailDb = _orderDetailService.GetByOrderDetailID(orderDetailVm.OrderID, orderDetailVm.ProductID);
                    orderDetailDb.UpdateOrderDetail(orderDetailVm);
                    _orderDetailService.Update(orderDetailDb);
                    _orderDetailService.SaveChanges();

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
                    _orderDetailService.Delete(id);
                    _orderDetailService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}