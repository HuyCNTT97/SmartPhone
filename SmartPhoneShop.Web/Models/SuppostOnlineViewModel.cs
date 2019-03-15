using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class SuppostOnlineViewModel
    {
        public int ID { set; get; }

        public string Name { set; get; }

        public string Department { set; get; }

        public string Skype { set; get; }

        public string Email { set; get; }

        public bool Status { set; get; }
        public int? DisplayOrder { set; get; }
    }
}