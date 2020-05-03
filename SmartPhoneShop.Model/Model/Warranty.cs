using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("Warranties")]
    public class Warranty
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        [MaxLength(250)]
        public string Name { set; get; }

        [MaxLength(int.MaxValue)]
        public string Description { set; get; }

        [MaxLength(150)]
        public string WarrantyOld { set; get; }

        [MaxLength(150)]
        public string WarrantyNew { set; get; }

        [MaxLength(150)]
        public string TimeInnovation { set; get; }

        [MaxLength(150)]
        public string FixTime { set; get; }

        public bool Status { set; get; }

        public virtual IEnumerable<OrderDetail> OrderDetails { set; get; }
    }
}