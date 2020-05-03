using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IOrderDetailRepository : IRepository<OrderDetail>
    {
        OrderDetail getOrderDetail(int orderID, int productID);
    }

    public class OrderDetailRepository : RepositoryBase<OrderDetail>, IOrderDetailRepository
    {
        public OrderDetailRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public OrderDetail getOrderDetail(int orderID, int productID)
        {
            return DbContext.OrderDetail.SingleOrDefault(x => x.OrderID == orderID && x.ProductID == productID);
        }
    }
}