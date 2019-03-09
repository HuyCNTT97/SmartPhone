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
    public interface ISuppostOnlineService
    {
        void Add(SuppostOnline suppostOnline);

        void Update(SuppostOnline suppostOnline);

        void Delete(int id);

        IEnumerable<SuppostOnline> GetAll();

        IEnumerable<SuppostOnline> GetAllPaging(int page, int pageSize, out int totalRow);

        SuppostOnline GetByID(int id);

        IEnumerable<SuppostOnline> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class SuppostOnlineService : ISuppostOnlineService
    {
        private ISuppostOnlineRepository _suppostOnlineRepository;
        private IUnitOfWork _unitOfWork;

        public void Add(SuppostOnline suppostOnline)
        {
            _suppostOnlineRepository.Add(suppostOnline);
        }

        public void Delete(int id)
        {
            _suppostOnlineRepository.Delete(id);
        }

        public IEnumerable<SuppostOnline> GetAll()
        {
            return _suppostOnlineRepository.GetAll();
        }

        public IEnumerable<SuppostOnline> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _suppostOnlineRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<SuppostOnline> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _suppostOnlineRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public SuppostOnline GetByID(int id)
        {
            return _suppostOnlineRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(SuppostOnline suppostOnline)
        {
            _suppostOnlineRepository.Update(suppostOnline);
        }
    }
}