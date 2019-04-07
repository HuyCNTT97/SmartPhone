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
    public interface IVisitorStatisticService
    {
        VisitorStatistic Add(VisitorStatistic visitorStatistic);

        void Update(VisitorStatistic visitorStatistic);

        void Delete(int id);

        IEnumerable<VisitorStatistic> GetAll();
        IEnumerable<VisitorStatistic> GetAll(string keyword);

        IEnumerable<VisitorStatistic> GetAllPaging(int page, int pageSize, out int totalRow);

        VisitorStatistic GetByID(Guid id);

        IEnumerable<VisitorStatistic> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class VisitorStatisticsService : IVisitorStatisticService
    {
        private IVisitorStatisticsRepository _visitorStatisticRepository;

        private IUnitOfWork _unitOfWork;

        public VisitorStatisticsService(IVisitorStatisticsRepository visitorStatisticRepository, IUnitOfWork unitOfWork)
        {
            this._visitorStatisticRepository = visitorStatisticRepository;
            this._unitOfWork = unitOfWork;
        }

        public VisitorStatistic Add(VisitorStatistic visitorStatistic)
        {
            return _visitorStatisticRepository.Add(visitorStatistic);
        }

        public void Delete(int id)
        {
            _visitorStatisticRepository.Delete(id);
        }

        public IEnumerable<VisitorStatistic> GetAll()
        {
            return _visitorStatisticRepository.GetAll();
        }

        public IEnumerable<VisitorStatistic> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _visitorStatisticRepository.GetAll();
            else return _visitorStatisticRepository.GetMulti(x => x.ID.ToString().Contains(keyword)
            || x.IPAddress.Contains(keyword));
        }

        public IEnumerable<VisitorStatistic> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _visitorStatisticRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<VisitorStatistic> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _visitorStatisticRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public VisitorStatistic GetByID(Guid id)
        {
            return _visitorStatisticRepository.GetSingleByCondition(x => x.ID == id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(VisitorStatistic visitorStatistic)
        {
            _visitorStatisticRepository.Update(visitorStatistic);
        }
    }
}