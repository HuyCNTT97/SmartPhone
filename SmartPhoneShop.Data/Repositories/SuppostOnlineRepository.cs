using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface ISuppostOnlineRepository : IRepository<SuppostOnline>
    {
    }

    public class SuppostOnlineRepository : RepositoryBase<SuppostOnline>, ISuppostOnlineRepository
    {
        public SuppostOnlineRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}