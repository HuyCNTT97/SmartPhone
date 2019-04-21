using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Data.Repositories;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Service
{
    public interface IOrderService
    {
        Order Add(Order orders);

        void Update(Order orders);

        void Delete(int id);

        IEnumerable<Order> GetAll();

        IEnumerable<Order> GetAllPaging(int page, int pageSize, out int totalRow);

        Order GetByID(int id);

        IEnumerable<Order> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class OrderService : IOrderService
    {
        private IOrderRepository _ordersRepository;
        private IUnitOfWork _unitofwork;

        public OrderService(IOrderRepository ordersRepository, IUnitOfWork unitOfWork)
        {
            this._ordersRepository = ordersRepository;
            this._unitofwork = unitOfWork;
        }

        public Order Add(Order orders)
        {
             _ordersRepository.Add(orders);
            _unitofwork.Commit();
            return orders;
        }

        public void Delete(int id)
        {
            _ordersRepository.Delete(id);
        }

        public IEnumerable<Order> GetAll()
        {
            return _ordersRepository.GetAll(new string[] { "Customers" });
        }

        public IEnumerable<Order> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _ordersRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Order> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _ordersRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Order GetByID(int id)
        {
            return _ordersRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(Order orders)
        {
            _ordersRepository.Update(orders);
        }
    }
}