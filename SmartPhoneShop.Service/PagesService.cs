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
    public interface IPageService
    {
        void Add(Page page);

        void Update(Page page);

        void Delete(int id);

        IEnumerable<Page> GetAll();

        IEnumerable<Page> GetAllPaging(int page, int pageSize, out int totalRow);

        Page GetByID(int id);

        IEnumerable<Page> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class PageService : IPageService
    {
        private IPageRepository _pageRepository;
        private IUnitOfWork _unitofwork;

        public PageService(IPageRepository pageRepository, IUnitOfWork unitOfWork)
        {
            this._pageRepository = pageRepository;
            this._unitofwork = unitOfWork;
        }

        public void Add(Page page)
        {
            _pageRepository.Add(page);
        }

        public void Delete(int id)
        {
            _pageRepository.Delete(id);
        }

        public IEnumerable<Page> GetAll()
        {
            return _pageRepository.GetAll();
        }

        public IEnumerable<Page> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _pageRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Page> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _pageRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public Page GetByID(int id)
        {
            return _pageRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(Page page)
        {
            _pageRepository.Update(page);
        }
    }
}