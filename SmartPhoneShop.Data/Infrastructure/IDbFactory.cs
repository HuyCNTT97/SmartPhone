using System;

namespace SmartPhoneShop.Data.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        SmartPhoneDbContext Init();
    }
}