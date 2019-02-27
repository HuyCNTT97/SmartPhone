using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("GoodReceipts")]
    public class GoodsReceipt
    {
        [Key]
        public int ProductID { set; get; }

        [Key]
        public int ShipmentID { set; get; }

        [Key]
        public DateTime DateReceipt { set; get; }

        public decimal Price { set; get; }
        public int Inventory { set; get; }
        public int Quantity { set; get; }

        [MaxLength(50)]
        public string Unit { set; get; }

        [ForeignKey("ProductID")]
        public virtual Product Products { set; get; }

        [ForeignKey("ShipmentID")]
        public virtual Shipment Shipments { set; get; }
    }
}