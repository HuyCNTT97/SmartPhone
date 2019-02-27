using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Abstract
{
    public abstract class ASamePostAndProduct : IAuditable, ISeoable, ISwitchable
    {
        [MaxLength(250)]
        public string Alias { get; set; }

        [MaxLength(int.MaxValue)]
        public string Content { get; set; }

        [MaxLength(250)]
        public string CreateBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [MaxLength(150)]
        public string Description { get; set; }

        public int? DisplayOrder { get; set; }
        public bool HomeFlag { get; set; }

        [MaxLength(int.MaxValue), Required]
        public string Image { get; set; }

        [MaxLength(150)]
        public string MetaDescription { get; set; }

        [MaxLength(150)]
        public string MetaKeyword { get; set; }

        [MaxLength(250), Required]
        public string Name { get; set; }

        public bool Status { get; set; }
        public string UpdateBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int ViewCount { get; set; }
    }
}