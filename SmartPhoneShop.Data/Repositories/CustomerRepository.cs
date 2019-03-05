using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface ICustomerRepository : IRepository<Customer>
    {
    }

    public class CustomerRepository : RepositoryBase<Customer>, ICustomerRepository
    {
        public CustomerRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}