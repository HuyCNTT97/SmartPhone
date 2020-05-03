using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Mvc;
using System.Security.Principal;

namespace SmartPhoneShop.Web.Infrasture.ActionFilter
{
    public class RequiredLogin : ActionFilterAttribute, IActionFilter
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                filterContext.Result = new RedirectToRouteResult("Login", null);
            }
            base.OnActionExecuted(filterContext);
        }
    }
}