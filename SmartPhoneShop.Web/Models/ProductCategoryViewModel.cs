using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class ProductCategoryViewModel : ASameProductCategoryAndPostCategory
    {
        public int ID { set; get; }

        public int? ParentID { set; get; }

        public string ParentName { set; get; }

        [Required]
        public string Image { set; get; }

        [ForeignKey("ProductCategoryID")]
        public virtual IEnumerable<ProductViewModel> Products { set; get; }
    }
}