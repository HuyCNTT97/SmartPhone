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
        void SellProduct(int productID, int quantity);

        void Delete(int id);
        bool ChangeShipping(int id,int productID);
        bool ChangePayment(int id,int productID);
        bool RefundPackage(int id,int productID);
        IEnumerable<OrderDetail> GetAll();
        IEnumerable<OrderDetail> GetAllByOrderID(string OrderID);
        IEnumerable<OrderDetail> GetAll(string keyword);

        OrderDetail GetByOrderDetailID(int OrderID, int ProductID);

        IEnumerable<OrderDetail> GetAllPaging(int page, int pageSize, out int totalRow);

        OrderDetail GetByID(int id);

        IEnumerable<OrderDetail> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class OrderDetailService : IOrderDetailService
    {
        private IProductService _productService;
        private IOrderDetailRepository _orderDetailRepository;

        private IUnitOfWork _unitofwork;

        public OrderDetailService(IOrderDetailRepository orderDetailRepository,IProductService productService, IUnitOfWork unitOfWork)
        {
            this._productService = productService;
            this._orderDetailRepository = orderDetailRepository;
            this._unitofwork = unitOfWork;
        }

        public OrderDetail Add(OrderDetail orderDetail)
        {
            return _orderDetailRepository.Add(orderDetail);
        }

        public bool ChangePayment(int id, int productID)
        {
            try
            {
                var orderDetail = _orderDetailRepository.getOrderDetail(id, productID);
                orderDetail.Payment = !orderDetail.Payment;
                _unitofwork.Commit();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool ChangeShipping(int id, int productID)
        {
            try
            {
                var orderDetail = _orderDetailRepository.getOrderDetail(id, productID);
                orderDetail.Shipping = !orderDetail.Shipping;
                _unitofwork.Commit();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Delete(int id)
        {
            _orderDetailRepository.Delete(id);
        }

        public IEnumerable<OrderDetail> GetAll()
        {
            return _orderDetailRepository.GetAll(new string[] { "Warranties", "Orders", "Products" });
        }

        public IEnumerable<OrderDetail> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _orderDetailRepository.GetAll();
           return _orderDetailRepository.GetMulti(x => x.OrderID.ToString().Contains(keyword));
        }

        public IEnumerable<OrderDetail> GetAllByOrderID(string OrderID)
        {
            return _orderDetailRepository.GetMulti(x => x.OrderID.ToString() == OrderID);
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

        public OrderDetail GetByOrderDetailID(int OrderID, int ProductID)
        {
            return _orderDetailRepository.GetSingleByCondition(x => x.OrderID == OrderID && x.ProductID == ProductID, null);
        }

        public bool RefundPackage(int id, int productID)
        {
            try
            {
                var orderDetail = _orderDetailRepository.getOrderDetail(id, productID);
                orderDetail.Payment = false;
                orderDetail.Shipping = false;
                _unitofwork.Commit();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void SellProduct(int productID, int quantity)
        {
            var product = _productService.GetByID(productID);
            product.Quantity = product.Quantity - quantity;
            _productService.SaveChanges();
        }

        public void Update(OrderDetail orderDetail)
        {
            _orderDetailRepository.Update(orderDetail);
        }
    }
}