using SmartPhoneShop.Data.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IPriceHistoryRepository
    {
    }

    public class PriceHistoryRepository : RepositoryBase<PriceHistoryRepository>, IPriceHistoryRepository
    {
        public PriceHistoryRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}