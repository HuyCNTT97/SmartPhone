using Newtonsoft.Json.Serialization;
using SmartPhoneShop.Data;
using SmartPhoneShop.Web.Mappings;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace SmartPhoneShop.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        void Application_BeginRequest(Object sender, EventArgs e)
        {
            Database.SetInitializer<SmartPhoneDbContext>(null);
        }
        protected void Application_Start()
        {

            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            AutoMapperConfiguration.Configure();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            var serializerSettings =
  GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings;
            var contractResolver =
              (DefaultContractResolver)serializerSettings.ContractResolver;
            contractResolver.IgnoreSerializableAttribute = true;
        }
    }
}