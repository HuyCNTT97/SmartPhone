using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("PostTags")]
    public class PostTag
    {
        [Column(Order = 1)]
        [Key]
        public int PostID { set; get; }

        [Column(Order = 2)]
        [Key]
        [MaxLength(50)]
        public string TagID { set; get; }

        [ForeignKey("TagID")]
        public virtual Tag Tags { set; get; }

        [ForeignKey("PostID")]
        public virtual Post Posts { set; get; }
    }
}