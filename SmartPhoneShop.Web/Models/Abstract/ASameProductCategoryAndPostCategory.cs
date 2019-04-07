using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models.Abstract
{
    public class ASameProductCategoryAndPostCategory
    {
        [Required]
        public string Alias { get; set; }

        public string CreateBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public int? DisplayOrder { get; set; }

        public bool HomeFlag { get; set; }

        public string MetaDescription { get; set; }

        public string MetaKeyword { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public bool Status { get; set; }

        public string UpdateBy { get; set; }

        public DateTime? UpdatedDate { get; set; }
    }
}