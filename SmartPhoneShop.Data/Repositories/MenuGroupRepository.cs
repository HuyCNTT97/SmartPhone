using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IMenuGroupRepository : IRepository<MenuGroups>
    {
    }

    public class MenuGroupRepository : RepositoryBase<MenuGroups>, IMenuGroupRepository
    {
        public MenuGroupRepository(IDbFactory dbContext) : base(dbContext)
        {
        }
    }
}