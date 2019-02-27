using System;
using System.ComponentModel.DataAnnotations;

namespace SmartPhoneShop.Model.Abstract
{
    public abstract class Auditable : IAuditable
    {
        public DateTime? CreatedDate { get; set; }

        [MaxLength(250)]
        public string CreateBy { get; set; }

        public DateTime? UpdatedDate { set; get; }

        [MaxLength(250)]
        public string UpdateBy { get; set; }
    }
}