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

        public string CustomerID { set; get; }

        [MaxLength(250), Required]
        public string NameShip { set; get; }

        [MaxLength(250), Required]
        public string AddressShip { set; get; }
        [Required,MinLength(10,ErrorMessage ="Phải nhập ít nhất là 10 số")]
        public string PhoneShip { set; get; }

        public DateTime OrderDate { set; get; }

        public bool GiaoDuHang { get; set; }
        public DateTime CreateDate { set; get; }

    }
}