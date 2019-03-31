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
    [RoutePrefix("api/producttag")]
    public class ProductTagController : ApiControllerBase
    {
        private IProductTagService _productTagService;

        public ProductTagController(IErrorService errorService, IProductTagService productTagService) :
            base(errorService)
        {
            this._productTagService = productTagService;
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listProductTag = _productTagService.GetAll();
                var listProductTagVM = Mapper.Map<List<ProductTagViewModel>>(listProductTag);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listProductTagVM);

                return response;
            });
        }

        [Route("add")]
        public HttpResponseMessage Post(HttpRequestMessage request, ProductTagViewModel productTagVm)
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
                    ProductTag newProductTag = new ProductTag();
                    newProductTag.UpdateProductTag(productTagVm);
                    var category = _productTagService.Add(newProductTag);
                    _productTagService.SaveChanges();
                    response = request.CreateResponse(HttpStatusCode.Created, category);
                }
                return response;
            });
        }

        [Route("update")]
        public HttpResponseMessage Put(HttpRequestMessage request, ProductTagViewModel productTagVm)
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
                    var productTagDb = _productTagService.GetByID(productTagVm.ProductID, productTagVm.TagID);
                    productTagDb.UpdateProductTag(productTagVm);
                    _productTagService.Update(productTagDb);
                    _productTagService.SaveChanges();

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
                    _productTagService.Delete(id);
                    _productTagService.SaveChanges();

                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }
    }
}