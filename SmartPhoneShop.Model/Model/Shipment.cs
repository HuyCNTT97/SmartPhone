﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("Shipments")]
    public class Shipment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        [MaxLength(250), Required]
        public string ProviderName { set; get; }

        [MaxLength(250), Required]
        public string ProviderAddress { set; get; }

        [MaxLength(250), Required]
        public int ProviderPhone { set; get; }

        [MaxLength(250), Required]
        public int Barcode { set; get; }
    }
}