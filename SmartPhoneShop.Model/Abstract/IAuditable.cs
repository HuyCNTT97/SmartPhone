using System;

namespace SmartPhoneShop.Model.Abstract
{
    public interface IAuditable
    {
        DateTime CreatedDate { get; set; }
        string CreateBy { get; set; }
        DateTime? UpdatedDate { set; get; }
        string UpdateBy { get; set; }
    }
}