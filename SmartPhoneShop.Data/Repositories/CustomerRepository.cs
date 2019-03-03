using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface ICustomerRepository
    {
    }

    public class CustomerRepository : RepositoryBase<Customer>, ICustomerRepository
    {
        public CustomerRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public IEnumerable<Customer> GetByAlias(string alias)
        {
            throw new NotImplementedException();
        }
    }
}