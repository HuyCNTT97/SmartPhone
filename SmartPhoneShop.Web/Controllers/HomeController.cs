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
            var listCategoryIphone = _productCategoryService.GetAll("IPhone");
            ViewBag.listCategoryIphone = Mapper.Map<IEnumerable<ProductCategory>,
                IEnumerable<ProductCategoryViewModel>>(listCategoryIphone);
            var listCategorySamsung = _productCategoryService.GetAll("Samsung");
            ViewBag.listCategorySamsung = Mapper.Map<IEnumerable<ProductCategory>,
                IEnumerable<ProductCategoryViewModel>>(listCategorySamsung);
            var listCategoryXiaomi = _productCategoryService.GetAll("Xiaomi");
            ViewBag.listCategoryXiaomi = Mapper.Map<IEnumerable<ProductCategory>,
                IEnumerable<ProductCategoryViewModel>>(listCategoryXiaomi);
            var listCategoryCamera = _productCategoryService.GetAll("Camera");
            ViewBag.listCategoryCamera = Mapper.Map<IEnumerable<ProductCategory>,
                IEnumerable<ProductCategoryViewModel>>(listCategoryCamera);

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
        public ActionResult slide()
        {
            var modelProductHot = _productService.GetProductHot();
            var modelSlide = _slideService.GetAll();
            ViewBag.listSlide = Mapper.Map<IEnumerable<Slide>, IEnumerable<SlideViewModel>>(modelSlide);
            ViewBag.listProductHot = Mapper.Map<IEnumerable<Product>, IEnumerable<ProductViewModel>>(modelProductHot);
            return PartialView();
        }
       public ActionResult MenuProductCategory()
        {
            return PartialView("MenuProductCategory");
        }
        [ChildActionOnly]
        public ActionResult navigation()
        {
            var model = _menuService.GetAll();
            var listMenuViewModel = Mapper.Map<IEnumerable<Menu>, IEnumerable<MenuViewModel>>(model);
            
            return PartialView(listMenuViewModel.ToList());
        }
    }
}