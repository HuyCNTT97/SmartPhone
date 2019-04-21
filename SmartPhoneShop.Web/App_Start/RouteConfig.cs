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
             name: "Register",
             url: "dang-ki.html",
             defaults: new { controller = "Account", action = "Register", id = UrlParameter.Optional },
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
