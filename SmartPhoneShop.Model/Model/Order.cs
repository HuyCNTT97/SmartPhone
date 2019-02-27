using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("Orders")]
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        public int CustomerID { set; get; }

        [MaxLength(250), Required]
        public string NameShip { set; get; }

        [MaxLength(250), Required]
        public string AddressShip { set; get; }

        public int PhoneShip { set; get; }
        public DateTime OrderDate { set; get; }

        [ForeignKey("CustomerID")]
        public virtual Customer Customers { set; get; }
    }
}