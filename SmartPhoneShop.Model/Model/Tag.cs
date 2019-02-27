using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("Tags")]
    public class Tag
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [MaxLength(50)]
        public int ID { set; get; }

        [MaxLength(100), Required]
        public string Name { set; get; }

        [Column(TypeName = "varchar")]
        [MaxLength(100), Required]
        public string Type { set; get; }
    }
}