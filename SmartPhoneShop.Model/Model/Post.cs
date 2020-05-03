using SmartPhoneShop.Model.Abstract;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace SmartPhoneShop.Model.Model
{
    [Table("Posts")]
    public class Post : ASamePostAndProduct
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        public int PostCategoryID { get; set; }

        [ForeignKey("PostCategoryID")]
        public virtual PostCategory PostCategory { set; get; }
    }
}