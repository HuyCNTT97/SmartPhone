using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Data.Infrastructure
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IDbFactory dbFactory;
        private SmartPhoneDbContext dbContext;

        public UnitOfWork(IDbFactory dbFactory)
        {
            this.dbFactory = dbFactory;
        }

        public SmartPhoneDbContext DbContent
        {
            get
            {
                return DbContent ?? (dbContext = dbFactory.Init());
            }
        }

        public void Commit()
        {
            DbContent.SaveChanges();
        }
    }
}