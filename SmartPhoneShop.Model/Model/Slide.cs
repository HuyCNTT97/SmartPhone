using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("Slides")]
    public class Slide
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { set; get; }

        [MaxLength(100)]
        public string Name { set; get; }

        [MaxLength(100)]
        public string Description { set; get; }

        [MaxLength(int.MaxValue)]
        public string Image { set; get; }

        [MaxLength(250)]
        public string URL { set; get; }

        public int DisplayOrder { set; get; }
        public bool Status { set; get; }
    }
}