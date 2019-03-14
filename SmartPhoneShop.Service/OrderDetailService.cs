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
    public interface IOrderDetailService
    {
        OrderDetail Add(OrderDetail orderDetail);

        void Update(OrderDetail orderDetail);

        void Delete(int id);

        IEnumerable<OrderDetail> GetAll();

        IEnumerable<OrderDetail> GetAllPaging(int page, int pageSize, out int totalRow);

        OrderDetail GetByID(int id);

        IEnumerable<OrderDetail> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class OrderDetailService : IOrderDetailService
    {
        private IOrderDetailRepository _orderDetailRepository;
        private IUnitOfWork _unitofwork;

        public OrderDetailService(IOrderDetailRepository orderDetailRepository, IUnitOfWork unitOfWork)
        {
            this._orderDetailRepository = orderDetailRepository;
            this._unitofwork = unitOfWork;
        }

        public OrderDetail Add(OrderDetail orderDetail)
        {
            return _orderDetailRepository.Add(orderDetail);
        }

        public void Delete(int id)
        {
            _orderDetailRepository.Delete(id);
        }

        public IEnumerable<OrderDetail> GetAll()
        {
            return _orderDetailRepository.GetAll(new string[] { "Warranties", "Orders", "Products" });
        }

        public IEnumerable<OrderDetail> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _orderDetailRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<OrderDetail> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _orderDetailRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public OrderDetail GetByID(int id)
        {
            return _orderDetailRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(OrderDetail orderDetail)
        {
            _orderDetailRepository.Update(orderDetail);
        }
    }
}