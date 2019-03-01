namespace SmartPhoneShop.Data.Infrastructure
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}