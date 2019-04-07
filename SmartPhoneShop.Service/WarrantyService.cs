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
        Warranty Add(Warranty warranty);

        void Update(Warranty warranty);

        void Delete(int id);

        IEnumerable<Warranty> GetAll();
        IEnumerable<Warranty> GetAll(string keyword);

        IEnumerable<Warranty> GetAllPaging(int page, int pageSize, out int totalRow);

        Warranty GetByID(int id);

        IEnumerable<Warranty> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class WarrantyService : IWarrantyService
    {
        private IWarrantyRepository _warrantyRepository;

        private IUnitOfWork _unitOfWork;

        public WarrantyService(IWarrantyRepository warrantyRepository, IUnitOfWork unitOfWork)
        {
            this._warrantyRepository = warrantyRepository;
            this._unitOfWork = unitOfWork;
        }

        public Warranty Add(Warranty warranty)
        {
            return _warrantyRepository.Add(warranty);
        }

        public void Delete(int id)
        {
            _warrantyRepository.Delete(id);
        }

        public IEnumerable<Warranty> GetAll()
        {
            return _warrantyRepository.GetAll();
        }

        public IEnumerable<Warranty> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _warrantyRepository.GetAll();
            else return _warrantyRepository.GetMulti(x => x.ID.ToString().Contains(keyword)
            || x.Name.Contains(keyword));
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