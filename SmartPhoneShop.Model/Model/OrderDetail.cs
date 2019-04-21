using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("OrderDetails")]
    public class OrderDetail
    {
        [Key]
        [Column(Order = 1)]
        public int ProductID { set; get; }

        [Key]
        [Column(Order = 2)]
        public int OrderID { set; get; }

        public decimal Price { set; get; }
        public decimal Promotion { set; get; }
        public int Quantity { set; get; }
        public bool Shipping { set; get; }
        public bool Payment { set; get; }
        public int WarrantyID { set; get; }
        public string Color { set; get; }
        [ForeignKey("OrderID")]
        public virtual Order Orders { set; get; }

        [ForeignKey("ProductID")]
        public virtual Product Products { set; get; }

        [ForeignKey("WarrantyID")]
        public virtual Warranty Warranties { set; get; }
    }
}