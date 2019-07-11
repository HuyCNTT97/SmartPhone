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
    [RoutePrefix("api/orderdetail")]
    [Authorize]
    public class OrderDetailController : ApiControllerBase
    {
        private IOrderDetailService _orderDetailService;
        private IProductService _productService;
        public OrderDetailController(IErrorService errorService,IProductService productService, IOrderDetailService orderDetailService) :
            base(errorService)
        {
            this._productService = productService;
            this._orderDetailService = orderDetailService;
        }

        [Route("getall")]
        public HttpResponseMessage GetAll(HttpRequestMessage request, string keyword, int page, int pageSize = 20)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _orderDetailService.GetAll(keyword);

                totalRow = model.Count();
                var query = model.OrderByDescending(x => x.OrderID).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<OrderDetail>, IEnumerable<OrderDetailViewModel>>(query);
                foreach (var item in responseData)
                {
                    item.Products =Mapper.Map<Product,ProductViewModel>( _productService.GetByID(item.ProductID));
                }
                var paginationSet = new PaginationSet<OrderDetailViewModel>()
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
        [Route("changeShipping")]
        [HttpGet]
        public HttpResponseMessage ChangeShipping(HttpRequestMessage request, int id,int productID)
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
                    var status = _orderDetailService.ChangeShipping(id, productID);
                    response = request.CreateResponse(HttpStatusCode.OK, status);
                }
                return response;
            });
        }
        [Route("changePayment")]
        [HttpGet]
        public HttpResponseMessage ChangePayment(HttpRequestMessage request, int id, int productID)
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
                    var status = _orderDetailService.ChangePayment(id, productID);
                    response = request.CreateResponse(HttpStatusCode.OK, status);
                }
                return response;
            });
        }
        [Route("refund")]
        [HttpGet]
        public HttpResponseMessage Refund(HttpRequestMessage request, int id, int productID)
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
                    var status = _orderDetailService.RefundPackage(id, productID);
                    response = request.CreateResponse(HttpStatusCode.OK, status);
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