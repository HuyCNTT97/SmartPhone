using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    [Serializable]
    public class ShoppingCartViewModel
    {
        public int ProductID{ set; get; }
        public ProductViewModel Product { set; get; }
        public int Quantity { set; get; }
        public string Color { set; get; }
    }
}