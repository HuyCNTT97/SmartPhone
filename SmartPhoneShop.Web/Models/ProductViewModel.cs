using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class ProductViewModel : AsameProductAndPost
    {
        public int ID { set; get; }

        public int ProductCategoryID { set; get; }

        public string MoreImages { set; get; }

        public bool HotFlag { set; get; }

        public string Specifications { set; get; }
        public int Quantity { set; get; }

        public virtual ProductCategoryViewModel ProductCategory { set; get; }
    }
}