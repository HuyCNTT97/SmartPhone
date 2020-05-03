using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models.Abstract
{
    public abstract class AsameProductAndPost
    {
        public string Alias { get; set; }

        public string Content { get; set; }

        public string CreateBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public string Description { get; set; }

        public int? DisplayOrder { get; set; }
        public bool HomeFlag { get; set; }

        public string Image { get; set; }

        public string MetaDescription { get; set; }

        public string MetaKeyword { get; set; }

        public string Name { get; set; }

        public bool Status { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int ViewCount { get; set; }
    }
}