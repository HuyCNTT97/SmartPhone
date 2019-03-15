using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class PriceHistoryViewModel
    {
        public int ProductID { set; get; }

        public string UpdateBy { set; get; }

        public DateTime UpdateDate { set; get; }

        public decimal Price { set; get; }
        public decimal Promotion { set; get; }

        public virtual ProductViewModel Products { set; get; }
    }
}