using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Abstract
{
    public interface ISwitchable
    {
        string Name { set; get; }
        string Alias { set; get; }
        int? DisplayOrder { set; get; }
        bool Status { set; get; }
        bool HomeFlag { set; get; }
    }
}