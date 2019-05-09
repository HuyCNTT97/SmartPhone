using SmartPhoneShop.Common;
using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IOrderRepository : IRepository<Order>
    {
         IEnumerable<StatisticDate> GetStatisticDates(string fromDate,string toDate);
    }

    public class OrderRepository : RepositoryBase<Order>, IOrderRepository
    {
        public OrderRepository(IDbFactory dbContext) : base(dbContext)
        {
        }

        public IEnumerable<StatisticDate> GetStatisticDates(string fromDate,string toDate)
        {
            IEnumerable<StatisticDate> listStatistic = new List<StatisticDate>();
            var table = from o in DbContext.Order
                        join od in DbContext.OrderDetail on o.ID equals od.OrderID
                        join p in DbContext.Product on od.ProductID equals p.ID
                        where o.CreateDate.Year == DateTime.Now.Year &&
                        o.CreateDate.Month == DateTime.Now.Month
                        && o.CreateDate.Day == DateTime.Now.Day
                        select new
                        {
                            CreateDate = o.CreateDate,
                            OriginalQuantityProduct = p.OriginalQuantity,
                            OriginalProductPrice = p.OriginalPrice,
                            OrderPrice = od.Price,
                            OrderQuantity = od.Quantity
                        };
            var fromDateDateTime = DateTime.Parse(fromDate);
            var toDateDateTime = DateTime.Parse(toDate);
            listStatistic = (from o in DbContext.Order
                             join od in DbContext.OrderDetail on o.ID equals od.OrderID
                             join p in DbContext.Product on od.ProductID equals p.ID
                             where o.CreateDate>fromDateDateTime && o.CreateDate<toDateDateTime
                             select new
                             {
                                 CreateDate = o.CreateDate,
                                 OriginalQuantityProduct = p.OriginalQuantity,
                                 OriginalProductPrice = p.OriginalPrice,
                                 OrderPrice = od.Price,
                                 OrderQuantity = od.Quantity
                             } into tb
                             group tb by tb.CreateDate into g
                             select new StatisticDate
                             {
                                 Date = g.Key,
                                 Revenues = g.Sum(x => x.OrderQuantity * x.OrderPrice),
                                 Profit = g.Sum(x => x.OrderQuantity * x.OrderPrice) - g.Sum(x => x.OriginalProductPrice * x.OrderQuantity)
                             }).ToList();
            return listStatistic;
        }
    }
}