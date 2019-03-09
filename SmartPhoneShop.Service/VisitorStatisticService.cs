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
    public interface IVisitorStatisticsService
    {
        void Add(VisitorStatistics visitorStatistic);

        void Update(VisitorStatistics visitorStatistic);

        void Delete(int id);

        IEnumerable<VisitorStatistics> GetAll();

        IEnumerable<VisitorStatistics> GetAllPaging(int page, int pageSize, out int totalRow);

        VisitorStatistics GetByID(int id);

        IEnumerable<VisitorStatistics> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class VisitorStatisticsService : IVisitorStatisticsService
    {
        private IVisitorStatisticsRepository _visitorStatisticRepository;
        private IUnitOfWork _unitOfWork;

        public void Add(VisitorStatistics visitorStatistic)
        {
            _visitorStatisticRepository.Add(visitorStatistic);
        }

        public void Delete(int id)
        {
            _visitorStatisticRepository.Delete(id);
        }

        public IEnumerable<VisitorStatistics> GetAll()
        {
            return _visitorStatisticRepository.GetAll();
        }

        public IEnumerable<VisitorStatistics> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _visitorStatisticRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<VisitorStatistics> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _visitorStatisticRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public VisitorStatistics GetByID(int id)
        {
            return _visitorStatisticRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(VisitorStatistics visitorStatistic)
        {
            _visitorStatisticRepository.Update(visitorStatistic);
        }
    }
}