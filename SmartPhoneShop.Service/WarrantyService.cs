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
    public interface IWarrantyService
    {
        void Add(Warranty warranty);

        void Update(Warranty warranty);

        void Delete(int id);

        IEnumerable<Warranty> GetAll();

        IEnumerable<Warranty> GetAllPaging(int page, int pageSize, out int totalRow);

        Warranty GetByID(int id);

        IEnumerable<Warranty> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class WarrantyService : IWarrantyService
    {
        private IWarrantyRepository _warrantyRepository;
        private IUnitOfWork _unitOfWork;

        public void Add(Warranty warranty)
        {
            _warrantyRepository.Add(warranty);
        }

        public void Delete(int id)
        {
            _warrantyRepository.Delete(id);
        }

        public IEnumerable<Warranty> GetAll()
        {
            return _warrantyRepository.GetAll();
        }

        public IEnumerable<Warranty> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _warrantyRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Warranty> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _warrantyRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public Warranty GetByID(int id)
        {
            return _warrantyRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Warranty warranty)
        {
            _warrantyRepository.Update(warranty);
        }
    }
}