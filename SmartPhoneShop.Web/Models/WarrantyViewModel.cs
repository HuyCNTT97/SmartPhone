using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class WarrantyViewModel
    {
        public int ID { set; get; }

        public string Name { set; get; }

        public string Description { set; get; }

        public bool Status { set; get; }
        public virtual IEnumerable<OrderDetailViewModel> OrderDetails { set; get; }
    }
}