using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class SlideViewModel
    {
        public int ID { set; get; }

        [Required]
        public string Name { set; get; }

        public string Description { set; get; }

        [Required]
        public string Image { set; get; }

        [Required]
        public string URL { set; get; }

        public int DisplayOrder { set; get; }

        [Required]
        public bool Status { set; get; }
    }
}