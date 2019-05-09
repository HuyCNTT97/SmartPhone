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

        [ForeignKey("ProductCategory")]
        public int ProductCategoryID { set; get; }

        [Column(TypeName = "xml")]
        public string MoreImages { set; get; }

        public bool HotFlag { set; get; }

        [MaxLength(250)]
        public string Specifications { set; get; }

        [Required]
        public decimal Price { set; get; }

        [Required]
        public int Quantity { set; get; }
        public int OriginalPrice { set; get; }
        public int OriginalQuantity { set; get; }
        [Required]
        public decimal Promotion { set; get; }

        public virtual ProductCategory ProductCategory { set; get; }
    }
}