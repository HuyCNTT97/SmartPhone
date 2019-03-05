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
    public interface ICustomerService
    {
        void Add(Customer customer);

        void Update(Customer customer);

        void Delete(int id);

        IEnumerable<Customer> GetAll();

        IEnumerable<Customer> GetAllPaging(int page, int pageSize, out int totalRow);

        Customer GetByID(int id);

        IEnumerable<Customer> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class CustomerService : ICustomerService
    {
        private ICustomerRepository _customerRepository;
        private IUnitOfWork _unitOfWork;

        public CustomerService(ICustomerRepository customerRepository, IUnitOfWork unitOfWork)
        {
            _customerRepository = customerRepository;
            _unitOfWork = unitOfWork;
        }

        public void Add(Customer customer)
        {
            _customerRepository.Add(customer);
        }

        public void Delete(int id)
        {
            _customerRepository.Delete(id);
        }

        public IEnumerable<Customer> GetAll()
        {
            return _customerRepository.GetAll(new string[] { "Orders" });
        }

        public IEnumerable<Customer> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _customerRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Customer> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _customerRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public Customer GetByID(int id)
        {
            return _customerRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Customer customer)
        {
            _customerRepository.Update(customer);
        }
    }
}