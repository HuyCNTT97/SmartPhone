using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class VisitorStatisticsViewModel
    {
        public Guid ID { set; get; }

        public DateTime VisitedDate { set; get; }

        public string IPAddress { set; get; }
    }
}