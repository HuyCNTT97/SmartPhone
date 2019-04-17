using AutoMapper;
using SmartPhoneShop.Common;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Infrastructure.Core;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartPhoneShop.Web.Controllers
{
    public class ProductController : Controller
    {
        private IProductCategoryService _productCategoryService;
        private IProductService _productService;
        public ProductController(IProductCategoryService productCategoryService,IProductService productService)
        {
            this._productCategoryService = productCategoryService;
            this._productService = productService;
        }
        public ActionResult Category(int id,int page=1)
        {
            int pageSize =int.Parse( ConfigHelper.GetByKey("pageSize"));
            int totalRow = 0;
            var modelListProduct = _productService.GetAllByCategoryIDPaging(id,page,pageSize,out totalRow);
            var modelProductCategory= _productCategoryService.GetByID(id);
            ViewBag.ProductCategory = Mapper.Map<ProductCategory, ProductCategoryViewModel>(modelProductCategory);
            int totalPage = totalRow / pageSize;
            var listProduct = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(modelListProduct);
            var paginationSet = new PaginationSet<ProductViewModel>()
            {
                Items = listProduct,
                MaxPage = 10,
                Page = page,
                TotalCount = totalRow,
                TotalPages = totalPage,
                
            };
            return View(paginationSet);
        }
    }
}