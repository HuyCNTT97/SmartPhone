using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IPriceHistoryRepository : IRepository<PriceHistory>
    {
    }

    public class PriceHistoryRepository : RepositoryBase<PriceHistory>, IPriceHistoryRepository
    {
        public PriceHistoryRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}