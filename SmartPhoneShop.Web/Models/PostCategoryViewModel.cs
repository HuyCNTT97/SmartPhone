using SmartPhoneShop.Web.Models.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class PostCategoryViewModel : ASameProductCategoryAndPostCategory
    {
        public int ID { set; get; }

        public string ParentName { set; get; }

        public int? ParentID { set; get; }

        public virtual IEnumerable<PostViewModel> Posts { set; get; }
    }
}