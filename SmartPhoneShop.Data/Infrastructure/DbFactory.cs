using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Infrastructure
{
    public class DbFactory : Disposeable, IDbFactory
    {
        private SmartPhoneDbContext dbContext;

        public SmartPhoneDbContext Init()
        {
            return dbContext ?? (dbContext = new SmartPhoneDbContext());
        }

        protected override void DisposeCore()
        {
            if (dbContext != null) dbContext.Dispose();
        }
    }
}