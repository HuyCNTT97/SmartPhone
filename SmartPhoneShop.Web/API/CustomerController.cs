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
    [RoutePrefix("api/customer")]
    public class CustomerController : ApiControllerBase
    {
        private ICustomerService _customerService;

        public CustomerController(IErrorService errorService, ICustomerService customerService) :
            base(errorService)
        {
            this._customerService = customerService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request, int page, int pageSize)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var listCustomer = _customerService.GetAll();
                totalRow = listCustomer.Count();
                var listCustomerVM = Mapper.Map<List<CustomerViewModel>>(listCustomer);

                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listCustomerVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, CustomerViewModel customerVm)
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
                    Customer newCustomer = new Customer();
                    newCustomer.UpdateCustomer(customerVm);
                    var category = _customerService.Add(newCustomer);
                    _customerService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, CustomerViewModel customerVm)
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
                    var customerDb = _customerService.GetByID(customerVm.ID);
                    customerDb.UpdateCustomer(customerVm);
                    _customerService.Update(customerDb);
                    _customerService.SaveChanges();

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
                    _customerService.Delete(id);
                    _customerService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}