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
            modelOrder.OrderDate = DateTime.Now;
            if (User.Identity.IsAuthenticated) modelOrder.CustomerID = User.Identity.GetUserId();
            modelOrder = _orderService.Add(modelOrder);
            var cart = Session[CommonConstants.SessionCart] as List<ShoppingCartViewModel>;
            foreach (var item in cart)
            {
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
            TempData["msgOrder"] = MessageBox.Show("Đặt hàng thành công, mời bạn kiểm tra đơn hàng");
            return Redirect("/");
        }
        //public ActionResult CreateOrder(string orderViewModel)
        //{
        //    var order = new JavaScriptSerializer().Deserialize<OrderViewModel>(orderViewModel);

        //    var orderNew = new Order();

        //    orderNew.UpdateOrder(order);

        //    if (Request.IsAuthenticated)
        //    {
        //        orderNew.CustomerID = User.Identity.GetUserId();
        //    }

        //    var cart = (List<ShoppingCartViewModel>)Session[CommonConstants.SessionCart];
        //    List<OrderDetail> orderDetails = new List<OrderDetail>();
        //    bool isEnough = true;
        //    foreach (var item in cart)
        //    {
        //        var detail = new OrderDetail();
        //        detail.ProductID = item.ProductID;
        //        detail.Quantity = item.Quantity;
        //        detail.Price = item.Product.Price;
        //        orderDetails.Add(detail);

        //        isEnough = _productService.SellProduct(item.ProductId, item.Quantity);
        //        break;
        //    }
        //    if (isEnough)
        //    {
        //        var orderReturn = _orderService.Create(ref orderNew, orderDetails);
        //        _productService.Save();

        //        if (order.PaymentMethod == "CASH")
        //        {
        //            return Json(new
        //            {
        //                status = true
        //            });
        //        }
        //        else
        //        {

        //            var currentLink = ConfigHelper.GetByKey("CurrentLink");
        //            RequestInfo info = new RequestInfo();
        //            info.Merchant_id = merchantId;
        //            info.Merchant_password = merchantPassword;
        //            info.Receiver_email = merchantEmail;



        //            info.cur_code = "vnd";
        //            info.bank_code = order.BankCode;

        //            info.Order_code = orderReturn.ID.ToString();
        //            info.Total_amount = orderDetails.Sum(x => x.Quantity * x.Price).ToString();
        //            info.fee_shipping = "0";
        //            info.Discount_amount = "0";
        //            info.order_description = "Thanh toán đơn hàng tại smartphone";
        //            info.return_url = currentLink + "xac-nhan-don-hang.html";
        //            info.cancel_url = currentLink + "huy-don-hang.html";

        //            info.Buyer_fullname = order.CustomerName;
        //            info.Buyer_email = order.CustomerEmail;
        //            info.Buyer_mobile = order.CustomerMobile;

        //            APICheckoutV3 objNLChecout = new APICheckoutV3();
        //            ResponseInfo result = objNLChecout.GetUrlCheckout(info, order.PaymentMethod);
        //            if (result.Error_code == "00")
        //            {
        //                return Json(new
        //                {
        //                    status = true,
        //                    urlCheckout = result.Checkout_url,
        //                    message = result.Description
        //                });
        //            }
        //            else
        //                return Json(new
        //                {
        //                    status = false,
        //                    message = result.Description
        //                });
        //        }

        //    }
        //    else
        //    {
        //        return Json(new
        //        {
        //            status = false,
        //            message = "Không đủ hàng."
        //        });
        //    }

        //}
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
                    if(quantity==null&&item.Color==color)
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

        //public ActionResult ConfirmOrder()
        //{
        //    string token = Request["token"];
        //    RequestCheckOrder info = new RequestCheckOrder();
        //    info.Merchant_id = merchantId;
        //    info.Merchant_password = merchantPassword;
        //    info.Token = token;
        //    APICheckoutV3 objNLChecout = new APICheckoutV3();
        //    ResponseCheckOrder result = objNLChecout.GetTransactionDetail(info);
        //    if (result.errorCode == "00")
        //    {
        //        //update status order
        //        _orderService.UpdateStatus(int.Parse(result.order_code));
        //        _orderService.Save();
        //        ViewBag.IsSuccess = true;
        //        ViewBag.Result = "Thanh toán thành công. Chúng tôi sẽ liên hệ lại sớm nhất.";
        //    }
        //    else
        //    {
        //        ViewBag.IsSuccess = true;
        //        ViewBag.Result = "Có lỗi xảy ra. Vui lòng liên hệ admin.";
        //    }
        //    return View();
        //}
        //public ActionResult CancelOrder()
        //{
        //    return View();
        //}
    }
}