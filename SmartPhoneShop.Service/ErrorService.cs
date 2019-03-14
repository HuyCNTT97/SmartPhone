using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeduShop.Model.Models;

namespace SmartPhoneShop.Service
{
    public interface IErrorService
    {
        Error Add(Error error);

        void Update(Error error);

        void Delete(int id);

        IEnumerable<Error> GetAll();

        IEnumerable<Error> GetAllPaging(int page, int pageSize, out int totalRow);

        Error GetByID(int id);

        IEnumerable<Error> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ErrorService : IErrorService
    {
        private IErrorRepository _errorRepository;
        private IUnitOfWork _unitOfWork;

        public ErrorService(IErrorRepository errorRepository, IUnitOfWork unitOfWork)
        {
            _errorRepository = errorRepository;
            _unitOfWork = unitOfWork;
        }

        public Error Add(Error error)
        {
            return _errorRepository.Add(error);
        }

        public void Delete(int id)
        {
            _errorRepository.Delete(id);
        }

        public IEnumerable<Error> GetAll()
        {
            return _errorRepository.GetAll(new string[] { "Orders" });
        }

        public IEnumerable<Error> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _errorRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Error> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _errorRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Error GetByID(int id)
        {
            return _errorRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Error error)
        {
            _errorRepository.Update(error);
        }
    }
}