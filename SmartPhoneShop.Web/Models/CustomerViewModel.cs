using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class CustomerViewModel
    {
        public int ID { set; get; }

        public virtual IEnumerable<OrderViewModel> Orders { set; get; }
    }
}