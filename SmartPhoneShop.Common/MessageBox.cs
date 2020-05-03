using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Common
{
    public class MessageBox
    {
        public static string Show(string msg)
        {
            return "<script>alert('" + msg + "')</script>";
        }
    }
}
