using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class OrderDetailViewModel
    {
        public int ProductID { set; get; }

        public int OrderID { set; get; }

        public decimal Price { set; get; }
        public decimal Promotion { set; get; }
        public int Quantity { set; get; }
        public bool Shipping { set; get; }
        public bool Payment { set; get; }
        public int WarrantyID { set; get; }

        public virtual OrderViewModel Orders { set; get; }

        public virtual ProductViewModel Products { set; get; }

        public virtual WarrantyViewModel Warranties { set; get; }
    }
}