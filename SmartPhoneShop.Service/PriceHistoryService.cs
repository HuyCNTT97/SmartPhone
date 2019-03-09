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
    public interface IPriceHistoryService
    {
        void Add(PriceHistory priceHistory);

        void Update(PriceHistory priceHistory);

        void Delete(int id);

        IEnumerable<PriceHistory> GetAll();

        IEnumerable<PriceHistory> GetAllPaging(int priceHistory, int priceHistorySize, out int totalRow);

        PriceHistory GetByID(int id);

        IEnumerable<PriceHistory> GetAllTagPaging(int priceHistory, int priceHistorySize, out int totalRow);

        void SaveChanges();
    }

    public class PriceHistoryService : IPriceHistoryService
    {
        private IPriceHistoryRepository _priceHistoryRepository;
        private IUnitOfWork _unitofwork;

        public PriceHistoryService(IPriceHistoryRepository priceHistoryRepository, IUnitOfWork unitOfWork)
        {
            this._priceHistoryRepository = priceHistoryRepository;
            this._unitofwork = unitOfWork;
        }

        public void Add(PriceHistory priceHistory)
        {
            _priceHistoryRepository.Add(priceHistory);
        }

        public void Delete(int id)
        {
            _priceHistoryRepository.Delete(id);
        }

        public IEnumerable<PriceHistory> GetAll()
        {
            return _priceHistoryRepository.GetAll(new string[] { "Products" });
        }

        public IEnumerable<PriceHistory> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _priceHistoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<PriceHistory> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _priceHistoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public PriceHistory GetByID(int id)
        {
            return _priceHistoryRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(PriceHistory priceHistory)
        {
            _priceHistoryRepository.Update(priceHistory);
        }
    }
}