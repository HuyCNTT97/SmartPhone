using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class ShipmentViewModel
    {
        public int ID { set; get; }

        public string ProviderName { set; get; }

        public string ProviderAddress { set; get; }

        public int ProviderPhone { set; get; }

        public int Barcode { set; get; }
        public virtual IEnumerable<GoodsReceiptViewModel> GoodsReceipts { set; get; }
    }
}