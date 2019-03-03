using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IShipmentRepository { }

    public class ShipmentRepository : RepositoryBase<Shipment>, IShipmentRepository
    {
        public ShipmentRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}