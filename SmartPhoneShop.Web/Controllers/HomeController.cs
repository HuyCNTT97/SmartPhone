using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SmartPhoneShop.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

       public ActionResult MenuProductCategory()
        {
            return PartialView("MenuProductCategory");
        }
        public ActionResult navigation()
        {
            return PartialView("navigation");
        }
    }
}