using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IVisitorStatisticsRepository : IRepository<VisitorStatistic>
    {
    }

    public class VisitorStatisticsRepository : RepositoryBase<VisitorStatistic>, IVisitorStatisticsRepository
    {
        public VisitorStatisticsRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}