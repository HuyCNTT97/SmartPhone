using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IGoodsReceiptRepository
    {
    }

    public class GoodsReceiptRepository : RepositoryBase<GoodsReceipt>, IGoodsReceiptRepository
    {
        public GoodsReceiptRepository(IDbFactory dbContext) : base(dbContext)
        {
        }
    }
}