using SmartPhoneShop.Data.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Repositories
{
    public interface IPostCategoryRepository
    {
    }

    internal class PostCategoryRepository : RepositoryBase<PostCategoryRepository>, IPostCategoryRepository
    {
        public PostCategoryRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}