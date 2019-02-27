using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("PriceHistories")]
    public class PriceHistory
    {
        [Key]
        public int ProductID { set; get; }

        [Key, MaxLength(100), Required]
        public string UpdateBy { set; get; }

        [Key]
        public DateTime UpdateDate { set; get; }

        public decimal Price { set; get; }
        public decimal Promotion { set; get; }

        [ForeignKey("ProductID")]
        public virtual Product Products { set; get; }
    }
}