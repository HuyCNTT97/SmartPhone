using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class CustomerViewModel
    {
        public int ID { set; get; }

        public string Account { get; set; }

        public string Address { get; set; }

        public string Name { get; set; }

        public string Password { get; set; }

        public int Phone { get; set; }
        public bool Status { get; set; }
        public virtual IEnumerable<OrderViewModel> Orders { set; get; }
    }
}