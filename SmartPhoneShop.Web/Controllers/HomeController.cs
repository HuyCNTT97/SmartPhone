using AutoMapper;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartPhoneShop.Web.Controllers
{
    public class HomeController : Controller
    {
        ISlideService _slideService;
        IMenuService _menuService;
        IProductService _productService;
        IProductCategoryService _productCategoryService;
        public HomeController(IProductCategoryService productCategoryService,
            IMenuService menuService
            ,ISlideService slideService,
            IProductService productService)
        {
            _productService = productService;
            _slideService = slideService;
            _menuService = menuService;
            _productCategoryService = productCategoryService;

        }

        public ActionResult Index()
        {
            var listIphone = _productService.GetProductWithCategoryHome("IPHONE").Take(4).ToList();
            ViewBag.listIphone = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(listIphone);
            var listSamSung = _productService.GetProductWithCategoryHome("Samsung").Take(4).ToList();
            ViewBag.listSamSung = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(listSamSung);
            var Xiaomi = _productService.GetProductWithCategoryHome("Xiaomi").Take(4).ToList();
            ViewBag.Xiaomi = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(Xiaomi);
            var Camera = _productService.GetProductWithCategoryHome("Camera").Take(4).ToList();
            ViewBag.Camera = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(Camera);
            return View();
        }
        [ChildActionOnly]
        public ActionResult Breadcrumb(string nameCategory)
        {
            var modelCategory = _productCategoryService.CheckBreadCrumb(nameCategory);
           var listCategory=Mapper.Map<IEnumerable<ProductCategory>,
               IEnumerable< ProductCategoryViewModel >> (modelCategory);

            return PartialView(listCategory);
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600*60)]

        public ActionResult slide()
        {
            var modelProductHot = _productService.GetProductHot();
            var modelSlide = _slideService.GetAll();
            ViewBag.listSlide = Mapper.Map<IEnumerable<Slide>, IEnumerable<SlideViewModel>>(modelSlide);
            ViewBag.listProductHot = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(modelProductHot);
            return PartialView();
        }
        public JsonResult GetListProductByName(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return Json(new
            {
                data = ""
            }, JsonRequestBehavior.AllowGet);
            var modelListProduct = _productService.getListProductName(keyword).ToList();
            return Json(new {
                data = modelListProduct
            },JsonRequestBehavior.AllowGet);
        }
        [ChildActionOnly]
        [OutputCache(Duration =3600*60)]
        public ActionResult footer()
        {
            
            return PartialView();
        }
        [HttpPost]
        public JsonResult GetCart()
        {
            decimal tong = 0;
            int quantity = 0;
            if (Session[Common.CommonConstants.SessionCart] == null)
                Session[Common.CommonConstants.SessionCart] = new List<ShoppingCartViewModel>();
            var cart = Session[Common.CommonConstants.SessionCart] as List<ShoppingCartViewModel>;
            foreach (var item in cart)
            {
                quantity = quantity + item.Quantity;
                tong = tong + item.Product.Price * item.Quantity;
            }
            string price = tong.ToString("N0") + " VND";
            return Json(new
            {
                price = price,
                quantity = quantity
            });
        }
        [ChildActionOnly]
        public ActionResult header()
        {
            return PartialView();
        }
        [ChildActionOnly]
        [OutputCache(Duration = 3600*60)]
        public ActionResult navigation()
        {
            var model = _menuService.GetAll();
            var listMenuViewModel = Mapper.Map<IEnumerable<Menu>, IEnumerable<MenuViewModel>>(model);
            
            return PartialView(listMenuViewModel.ToList());
        }
    }
}