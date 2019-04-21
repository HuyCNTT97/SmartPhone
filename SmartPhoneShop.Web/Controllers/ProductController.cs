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
using System.Web.Script.Serialization;

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
        public ActionResult Detail(int id)
        {
            var modelProduct = _productService.GetByID(id);
            var modelProductCategory = _productCategoryService.GetByID(modelProduct.ProductCategoryID);
            ProductCategory modelParenCategory;
            if (modelProductCategory.ParentID != null)
            {
               modelParenCategory   = _productCategoryService.GetByID(int.Parse
                (modelProductCategory.ParentID.ToString()));
                ViewBag.parentCategory = Mapper.Map<ProductCategory, ProductCategoryViewModel>(modelParenCategory);
            }

            var modelListProductRelated = _productService.GetAllByCategoryID(modelProductCategory.ID).Take(4);
            ViewBag.product = Mapper.Map<Product, ProductViewModel>(modelProduct);
            ViewBag.ListProductRelated = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(modelListProductRelated);
            ViewBag.productCategory = Mapper.Map<ProductCategory, ProductCategoryViewModel>(modelProductCategory);
            List<string> listImage = new JavaScriptSerializer().Deserialize<List<string>>(modelProduct.MoreImages);
            ViewBag.listImage = listImage;
            return View();
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
        [HttpGet]
        public ActionResult Search(string keyword, int page = 1)
        {
            int pageSize = int.Parse(ConfigHelper.GetByKey("pageSize"));
            if (keyword == null) return null;
            int totalRow = 0;
            var modelListProduct = _productService.GetAllByCategoryNamePaging(keyword, page, pageSize, out totalRow);
            
            int totalPage = totalRow / pageSize;
            ViewBag.keyword = keyword;
            var listProduct = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(modelListProduct);
            foreach (var item in listProduct)
            {
                item.ProductCategory = _productCategoryService.GetByID(item.ProductCategoryID);
            }
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