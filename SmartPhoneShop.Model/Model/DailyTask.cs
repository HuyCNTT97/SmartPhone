using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("DailyTasks")]
    public class DailyTask
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public string TaskName { get; set; }
        public string Description { get; set; }
        [Required]
        public DateTime ExprireDate { set; get; }
        public DateTime CreatedDate { set; get; }
        [ForeignKey("TaskCategory")]
        public int TaskCategoriesId { set;get; }
        public virtual TaskCategory TaskCategory { set; get; }
    }
}
