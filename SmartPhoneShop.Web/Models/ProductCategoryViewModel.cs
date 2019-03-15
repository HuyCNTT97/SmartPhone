using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class ProductCategoryViewModel : ASameProductCategoryAndPostCategory
    {
        public int ID { set; get; }

        public int ParentID { set; get; }

        public string Image { set; get; }

        public virtual IEnumerable<ProductViewModel> Products { set; get; }
    }
}