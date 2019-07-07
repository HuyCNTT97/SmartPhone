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
        Customer Add(Customer customer);

        void Update(Customer customer);

        void Delete(int id);

        IEnumerable<Customer> GetAll();

        IEnumerable<Customer> GetAll(string keyword);

        IEnumerable<Customer> GetAllPaging(int page, int pageSize, out int totalRow);

        Customer GetByID(int id);
        string GetName(string id);

        IEnumerable<Customer> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class CustomerService : ICustomerService
    {
        private ICustomerRepository _customerRepository;

        private IUnitOfWork _unitOfWork;

        public CustomerService(ICustomerRepository customerRepository, IUnitOfWork unitOfWork)
        {
            this._customerRepository = customerRepository;
            this._unitOfWork = unitOfWork;
        }

        public Customer Add(Customer customer)
        {
            return _customerRepository.Add(customer);
        }

        public void Delete(int id)
        {
            _customerRepository.Delete(id);
        }

        public IEnumerable<Customer> GetAll()
        {
            return _customerRepository.GetAll();
        }

        public IEnumerable<Customer> GetAll(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
                return _customerRepository.GetMulti(x => x.Address.Contains(keyword)
                || x.Name.Contains(keyword) || x.Phone.ToString().Contains(keyword));
            else
            {
                return _customerRepository.GetAll();
            }
        }

        public IEnumerable<Customer> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _customerRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Customer> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _customerRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Customer GetByID(int id)
        {
            return _customerRepository.GetSingleById(id);
        }

        public string GetName(string id)
        {
            return _customerRepository.GetSingleByCondition(x => x.ID.ToString() == id).ID.ToString();
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