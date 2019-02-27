using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Abstract
{
    public abstract class AUser : IUser
    {
        [MaxLength(100), Required]
        public string Account { get; set; }

        [MaxLength(250), Required]
        public string Address { get; set; }

        [MaxLength(250), Required]
        public string Name { get; set; }

        [MaxLength(100), Required]
        public string Password { get; set; }

        public int Phone { get; set; }
    }
}