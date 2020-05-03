using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SmartPhoneShop.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // BotDetect requests must not be routed
            routes.IgnoreRoute("{*botdetect}", new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });
            routes.MapRoute(
            name: "Manager Order",
            url: "don-hang.html",
            defaults: new { controller = "ShoppingCart", action = "Order", id = UrlParameter.Optional },
            namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
        );
            routes.MapRoute(
             name: "Register",
             url: "dang-ki.html",
             defaults: new { controller = "Account", action = "Register", id = UrlParameter.Optional },
             namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
         );
            routes.MapRoute(
            name: "Information Account",
            url: "thong-tin-tai-khoan.html",
            defaults: new { controller = "Manage", action = "Index", id = UrlParameter.Optional },
            namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

        );
            //VerifyPhoneNumber
            routes.MapRoute(
           name: "VerifyPhoneNumber PhoneNumber",
           url: "xac-nhan-so-dien-thoai.html",
           defaults: new { controller = "Manage", action = "VerifyPhoneNumber", id = UrlParameter.Optional },
           namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

       );
            routes.MapRoute(
            name: "Add PhoneNumber",
            url: "them-so-dien-thoai.html",
            defaults: new { controller = "Manage", action = "AddPhoneNumber", id = UrlParameter.Optional },
            namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

        );
            routes.MapRoute(
           name: "Get All Task Category",
           url: "task-category",
           defaults: new { controller = "TaskCategory", action = "Index", id = UrlParameter.Optional },
           namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

       );
           routes.MapRoute(
           name: "Create Task Category",
           url: "task-category/create",
           defaults: new { controller = "TaskCategory", action = "Create", id = UrlParameter.Optional },
           namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

       );
            routes.MapRoute(
           name: "Edit Task Category",
           url: "task-category/edit/{id}",
           defaults: new { controller = "TaskCategory", action = "Edit", id = UrlParameter.Optional },
           namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

       );
            routes.MapRoute(
           name: "Remove Task Category",
           url: "task-category/delete/{id}",
           defaults: new { controller = "TaskCategory", action = "Delete", id = UrlParameter.Optional },
           namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }

       );
            routes.MapRoute(
            name: "Login",
            url: "dang-nhap.html",
            defaults: new { controller = "Account", action = "Login", id = UrlParameter.Optional },
            namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
        );
            routes.MapRoute(
            name: "Checkout",
            url: "thanh-toan.html",
            defaults: new { controller = "ShoppingCart", action = "Checkout", id = UrlParameter.Optional },
            namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
        );
            routes.MapRoute(
         name: "Cart",
         url: "gio-hang.html",
         defaults: new { controller = "ShoppingCart", action = "Index", id = UrlParameter.Optional },
         namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
     );
            routes.MapRoute(
                name: "Product Follow Category",
                url: "{alias}-{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
                namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
            );

            routes.MapRoute(
                name: "Search",
                url: "san-pham/tim-kiem/",
                defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
                namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
            );
            routes.MapRoute(
               name: "Product detail",
               url: "{category}/{alias}-{id}",
               defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
               namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
           );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "SmartPhoneShop.Web.Controllers" }
            );


        }
    }
}
