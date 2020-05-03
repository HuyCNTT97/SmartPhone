using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Model.Model
{
    [Table("TaskCategories")]
    public class TaskCategory
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public string CategoryName { get; set; }

        public ICollection<DailyTask> DailyTasks {get;set;}

    }
}
