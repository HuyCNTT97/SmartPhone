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
    public interface IFooterService
    {
        Footer Add(Footer footer);

        void Update(Footer footer);

        void Delete(int id);

        IEnumerable<Footer> GetAll();

        IEnumerable<Footer> GetAllPaging(int page, int pageSize, out int totalRow);

        Footer GetByID(int id);

        IEnumerable<Footer> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class FooterService : IFooterService
    {
        private IFooterRepository _footerRepository;

        private IUnitOfWork _unitOfWork;

        public FooterService(IFooterRepository footerRepository, IUnitOfWork unitOfWork)
        {
            this._footerRepository = footerRepository;
            this._unitOfWork = unitOfWork;
        }

        public Footer Add(Footer footer)
        {
            return _footerRepository.Add(footer);
        }

        public void Delete(int id)
        {
            _footerRepository.Delete(id);
        }

        public IEnumerable<Footer> GetAll()
        {
            return _footerRepository.GetAll();
        }

        public IEnumerable<Footer> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _footerRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Footer> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _footerRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Footer GetByID(int id)
        {
            return _footerRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Footer footer)
        {
            _footerRepository.Update(footer);
        }
    }
}