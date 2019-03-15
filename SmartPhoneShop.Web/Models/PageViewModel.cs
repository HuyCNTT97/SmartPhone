using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class PageViewModel : ASeoable
    {
        public int ID { set; get; }

        public string Name { set; get; }

        public string Content { set; get; }

        public bool Status { set; get; }
    }
}