using AutoMapper;
using Microsoft.AspNet.Identity;
using SmartPhoneShop.Common;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.App_Start;
using SmartPhoneShop.Web.Infrasture.Extension;
using SmartPhoneShop.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace SmartPhoneShop.Web.Controllers
{
    public class ShoppingCartController : Controller
    {
        IProductService _productService;
        IOrderService _orderService;
        IOrderDetailService _orderDetailService;
        private ApplicationUserManager _userManager;
   
    
        public ActionResult Order()
        {
            if (!User.Identity.IsAuthenticated)
            {
                TempData["msgLogin"] = MessageBox.Show("Bạn phải đăng nhập trước khi thanh toán");
                return Redirect("/dang-nhap.html?returnUrl=" + HttpContext.Request.Url.AbsolutePath);
            }
            var listOrder = _orderService.GetAllByName(User.Identity.GetUserId());
            var model = Mapper.Map<IEnumerable<Order>, IEnumerable<OrderViewModel>>(listOrder);
            foreach (var item in model)
            {

                var orderDetail = _orderDetailService.GetAllByOrderID(item.ID.ToString());
                item.OrderDetail = Mapper.Map<IEnumerable<OrderDetail>,IEnumerable<OrderDetailViewModel>>(orderDetail);
                foreach (var name in item.OrderDetail)
                {
                    var product = _productService.GetByID(name.ProductID);
                    name.Products = Mapper.Map<Product,ProductViewModel>(product);
                }
            }
            return View(model);
        }
        public ShoppingCartController(IOrderService orderService,IOrderDetailService orderDetailService, IProductService productService, ApplicationUserManager userManager)
        {
            this._orderDetailService = orderDetailService;
            this._productService = productService;
            this._userManager = userManager;
            this._orderService = orderService;
        }
        // GET: ShoppingCart
        public ActionResult Index()

        {
            if (Session[CommonConstants.SessionCart] == null)
                Session[CommonConstants.SessionCart] = new List<ShoppingCartViewModel>();
            return View();
        }

        public ActionResult CheckOut()
        {
            if (!User.Identity.IsAuthenticated)
            {
                TempData["msgLogin"] = MessageBox.Show("Bạn phải đăng nhập trước khi thanh toán");
                return Redirect("/dang-nhap.html?returnUrl=" + HttpContext.Request.Url.AbsolutePath);
            }
            if (Session[CommonConstants.SessionCart] == null)
            {
                return Redirect("/gio-hang.html");
            }
            var cart = Session[CommonConstants.SessionCart] as List<ShoppingCartViewModel>;

            return View(cart);
        }
        [HttpPost]
        public JsonResult GetUser()
        {
            if (Request.IsAuthenticated)
            {
                var userID = User.Identity.GetUserId();
                var user = _userManager.FindById(userID);
               
                return Json(new
                {
                    status = true,
                    user = user
                });
            }
            return Json(new
            {
                status = false
            });
        }
        public JsonResult Update(string cartData)
        {
            var cartModel = new JavaScriptSerializer().Deserialize<List<ShoppingCartViewModel>>(cartData);
            foreach (var item in cartModel)
            {
                var product = _productService.GetByID(item.ProductID);
                item.Product = Mapper.Map<Product, ProductViewModel>(product);

            }
            Session[CommonConstants.SessionCart] = cartModel;

            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public ActionResult CheckOut(Order modelOrder) {
            if (ModelState.IsValid)
            {
                modelOrder.CreateDate = DateTime.Now;
                modelOrder.OrderDate = DateTime.Now;
                if (User.Identity.IsAuthenticated) modelOrder.CustomerID = User.Identity.GetUserId();
                modelOrder = _orderService.Add(modelOrder);
                var cart = Session[CommonConstants.SessionCart] as List<ShoppingCartViewModel>;
                decimal tong = 0;
                foreach (var item in cart)
                {
                    tong = tong + item.Product.Price * item.Quantity;
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderID = modelOrder.ID;
                    orderDetail.Price = item.Product.Price;
                    orderDetail.Color = item.Color;
                    orderDetail.Promotion = item.Product.Promotion;
                    orderDetail.ProductID = item.ProductID;
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.WarrantyID = 1;
                    _orderDetailService.Add(orderDetail);
                    _orderDetailService.SellProduct(item.ProductID, item.Quantity);
                }
                string content = System.IO.File.ReadAllText(Server.MapPath("~/Views/ShoppingCart/Order.html"));
                content = content.Replace("{{Name}}", modelOrder.NameShip);
                content = content.Replace("{{Address}}", modelOrder.AddressShip);
                content = content.Replace("{{Phone}}", modelOrder.PhoneShip.ToString());
                content = content.Replace("{{Count}}", cart.Count().ToString());
                string tongTien = tong.ToString("N0");
                content = content.Replace("{{Price}}", tongTien + " VND");

                MailHelper.SendMail(_userManager.GetEmail(User.Identity.GetUserId()), "Xác nhận hóa đơn mua hàng", content);
                Session[Common.CommonConstants.SessionCart] = null;
                TempData["msgOrder"] = MessageBox.Show("Đặt hàng thành công, mời bạn kiểm tra đơn hàng trong email hoặc quản lý hóa đơn");

                return Redirect("/don-hang.html");
            }
            return View(modelOrder);
        }
        
        [HttpGet]
        public JsonResult GetAll()
        {
            if (Session[CommonConstants.SessionCart] == null)
                Session[CommonConstants.SessionCart] = new List<ShoppingCartViewModel>();
            var cart = (List<ShoppingCartViewModel>)Session[CommonConstants.SessionCart];
            return Json(new
            {
                data = cart,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Add(int productId,int? quantity,string color)
        {
            color = color.Replace(" ","");
            var cart = (List<ShoppingCartViewModel>)Session[CommonConstants.SessionCart];
            var product = _productService.GetByID(productId);
            if (cart == null)
            {
                cart = new List<ShoppingCartViewModel>();
            }
            if (product.Quantity == 0)
            {
                return Json(new
                {
                    status = false,
                    message = "Sản phẩm này hiện đang hết hàng"
                });
            }
            if (quantity <= 0)
            {
                return Json(new
                {
                    status = false,
                    message = "Số lượng mua phải lớn hơn 0"
                });
            }
            if (cart.Any(x => x.ProductID == productId&&x.Color==color))
            {
                foreach (var item in cart)
                {
                    if (item.ProductID == productId&&quantity!=null&&item.Color==color)
                    {
                        item.Quantity += int.Parse(quantity.ToString());
                    }
                    if(quantity==null&&item.Color==color&& item.ProductID == productId)
                    {
                        item.Quantity += 1;
                    }
                }
            }
            else
            {
                ShoppingCartViewModel newItem = new ShoppingCartViewModel();
                newItem.ProductID = productId;
                newItem.Product = Mapper.Map<Product, ProductViewModel>(product);
                newItem.Color = color;
                if(quantity!=null)
                newItem.Quantity = int.Parse(quantity.ToString());
                else
                {
                    newItem.Quantity =1;

                }
                cart.Add(newItem);
            }

            Session[CommonConstants.SessionCart] = cart;
            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        public JsonResult DeleteItem(int productId)
        {
            var cartSession = (List<ShoppingCartViewModel>)Session[CommonConstants.SessionCart];
            if (cartSession != null)
            {
                cartSession.RemoveAll(x => x.ProductID == productId);
                Session[CommonConstants.SessionCart] = cartSession;
                return Json(new
                {
                    status = true
                });
            }
            return Json(new
            {
                status = false
            });
        }

        [HttpPost]
        public JsonResult DeleteAll()
        {
            Session[CommonConstants.SessionCart] = new List<ShoppingCartViewModel>();
            return Json(new
            {
                status = true
            });
        }

        
    }
}