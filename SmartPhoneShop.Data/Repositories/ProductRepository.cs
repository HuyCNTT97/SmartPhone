using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IProductRepository : IRepository<Product>
    {
        IEnumerable<Product> GetAllByTagPaging(string tag, int page, int pageSize, out int totalRow);
    }

    public class ProductRepository : RepositoryBase<Product>, IProductRepository
    {
        public ProductRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public IEnumerable<Product> GetAllByTagPaging(string tag, int page, int pageSize, out int totalRow)
        {
            var query = from proDuct in DbContext.Product
                        join productTag in DbContext.ProductTag
                        on proDuct.ID equals productTag.ProductID
                        where productTag.TagID == tag
                        orderby proDuct.CreatedDate descending
                        select proDuct;
            totalRow = query.Count();
            return query;
        }
    }
}