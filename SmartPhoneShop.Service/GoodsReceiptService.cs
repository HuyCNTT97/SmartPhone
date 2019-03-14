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
    public interface IGoodsReceiptService
    {
        GoodsReceipt Add(GoodsReceipt goodsReceipt);

        void Update(GoodsReceipt goodsReceipt);

        void Delete(int id);

        IEnumerable<GoodsReceipt> GetAll();

        IEnumerable<GoodsReceipt> GetAllPaging(int page, int pageSize, out int totalRow);

        GoodsReceipt GetByID(int id);

        IEnumerable<GoodsReceipt> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class GoodsReceiptService : IGoodsReceiptService
    {
        private IGoodsReceiptRepository _goodsReceiptRepository;
        private IUnitOfWork _unitOfWork;

        public GoodsReceiptService(IGoodsReceiptRepository goodsReceiptRepository, IUnitOfWork unitOfWork)
        {
            this._goodsReceiptRepository = goodsReceiptRepository;
            this._unitOfWork = unitOfWork;
        }

        public GoodsReceipt Add(GoodsReceipt goodsReceipt)
        {
            return _goodsReceiptRepository.Add(goodsReceipt);
        }

        public void Delete(int id)
        {
            _goodsReceiptRepository.Delete(id);
        }

        public IEnumerable<GoodsReceipt> GetAll()
        {
            return _goodsReceiptRepository.GetAll(new string[] { "Shipments", "Products" });
        }

        public IEnumerable<GoodsReceipt> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _goodsReceiptRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<GoodsReceipt> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _goodsReceiptRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public GoodsReceipt GetByID(int id)
        {
            return _goodsReceiptRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(GoodsReceipt goodsReceipt)
        {
            _goodsReceiptRepository.Update(goodsReceipt);
        }
    }
}