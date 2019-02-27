using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Abstract
{
    public abstract class ASameProductCategoryAndPostCategory : ISeoable, IAuditable, ISwitchable
    {
        [MaxLength(250), Required]
        public string Alias { get; set; }

        [MaxLength(250)]
        public string CreateBy { get; set; }

        public DateTime? CreatedDate { get; set; }
        public int? DisplayOrder { get; set; }
        public bool HomeFlag { get; set; }

        [MaxLength(250)]
        public string MetaDescription { get; set; }

        [MaxLength(250)]
        public string MetaKeyword { get; set; }

        [MaxLength(250), Required]
        public string Name { get; set; }

        public bool Status { get; set; }

        [MaxLength(250)]
        public string UpdateBy { get; set; }

        public DateTime? UpdatedDate { get; set; }
    }
}