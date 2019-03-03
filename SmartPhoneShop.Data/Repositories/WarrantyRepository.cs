using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IWarrantyRepository { }

    public class WarrantyRepository : RepositoryBase<Warranty>, IWarrantyRepository
    {
        public WarrantyRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}