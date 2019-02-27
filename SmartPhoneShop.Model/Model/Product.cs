using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SmartPhoneShop.Model.Model
{
    [Table("Products")]
    public class Product : Abstract.ASamePostAndProduct
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        public int ProductCategoryID { set; get; }
        public XElement MoreImages { set; get; }
        public bool HotFlag { set; get; }

        [MaxLength(250)]
        public string Specifications { set; get; }

        [ForeignKey("ProductCategoryID")]
        public virtual ProductCategory ProductCategory { set; get; }
    }
}