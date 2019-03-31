using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class OrderViewModel
    {
        public int ID { set; get; }

        public int CustomerID { set; get; }

        public string NameShip { set; get; }

        public string AddressShip { set; get; }

        public int PhoneShip { set; get; }

        public DateTime OrderDate { set; get; }

        public bool GiaoDuHang { get; set; }

        public virtual CustomerViewModel Customers { set; get; }
    }
}