using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class PostViewModel : AsameProductAndPost
    {
        public int ID { get; set; }

        public int PostCategoryID { get; set; }

        public virtual PostCategoryViewModel PostCategory { set; get; }
    }
}