using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("ProductCategories")]
    public class ProductCategory : Abstract.ASameProductCategoryAndPostCategory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        public int? ParentID { set; get; }

        [MaxLength(int.MaxValue)]
        public string Image { set; get; }

        public virtual IEnumerable<Product> Products { set; get; }
    }
}