using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    [Serializable]
    public class ProductViewModel : AsameProductAndPost
    {
        public int ID { set; get; }

        public int ProductCategoryID { set; get; }

        public string MoreImages { set; get; }

        public bool HotFlag { set; get; }

        public string Specifications { set; get; }

        public string Color { set; get; }
        [Required]
        public decimal Promotion { set; get; }

        [Required]
        public decimal Price { set; get; }

        [Required]
        public int Quantity { set; get; }
        public int OriginalQuantity { set; get; }

        public virtual ProductCategory ProductCategory { set; get; }
    }
}