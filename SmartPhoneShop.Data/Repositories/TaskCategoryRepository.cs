using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface ITaskCategoryRepository : IRepository<TaskCategory>
    {
    }

    public class TaskCategoryRepository : RepositoryBase<TaskCategory>, ITaskCategoryRepository
    {
        public TaskCategoryRepository(IDbFactory dbContext) : base(dbContext)
        {
        }
    }
}
