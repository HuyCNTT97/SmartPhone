using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class GoodsReceiptViewModel
    {
        public int ProductID { set; get; }

        public int ShipmentID { set; get; }

        public DateTime DateReceipt { set; get; }

        public decimal Price { set; get; }
        public int Inventory { set; get; }
        public int Quantity { set; get; }

        public string Unit { set; get; }

        public virtual ProductViewModel Products { set; get; }

        public virtual ShipmentViewModel Shipments { set; get; }
    }
}