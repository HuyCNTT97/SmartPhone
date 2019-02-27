using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Abstract
{
    public interface IUser
    {
        string Name { set; get; }
        string Address { set; get; }
        int Phone { set; get; }
        string Account { set; get; }
        string Password { set; get; }
    }
}