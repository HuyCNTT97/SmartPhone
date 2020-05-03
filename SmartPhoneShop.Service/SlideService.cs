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
    public interface ISlideService
    {
        Slide Add(Slide slide);

        void Update(Slide slide);

        void Delete(int id);

        IEnumerable<Slide> GetAll();

        IEnumerable<Slide> GetAll(string keyword);

        IEnumerable<Slide> GetAllPaging(int page, int pageSize, out int totalRow);

        Slide GetByID(int id);

        IEnumerable<Slide> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class SlideService : ISlideService
    {
        private ISlideRepository _slideRepository;

        private IUnitOfWork _unitOfWork;

        public SlideService(ISlideRepository slideRepository, IUnitOfWork unitOfWork)
        {
            this._slideRepository = slideRepository;
            this._unitOfWork = unitOfWork;
        }

        public Slide Add(Slide slide)
        {
            return _slideRepository.Add(slide);
        }

        public void Delete(int id)
        {
            _slideRepository.Delete(id);
        }

        public IEnumerable<Slide> GetAll()
        {
            return _slideRepository.GetAll();
        }

        public IEnumerable<Slide> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _slideRepository.GetAll();
            else return _slideRepository.GetMulti(x => x.Name.Contains(keyword)
            || x.ID.ToString().Contains(keyword));
        }

        public IEnumerable<Slide> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _slideRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Slide> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _slideRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public Slide GetByID(int id)
        {
            return _slideRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Slide slide)
        {
            _slideRepository.Update(slide);
        }
    }
}