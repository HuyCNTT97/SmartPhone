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
    public interface IProductTagService
    {
        ProductTag Add(ProductTag productTag);

        void Update(ProductTag productTag);

        void Delete(int id);

        IEnumerable<ProductTag> GetAll();

        IEnumerable<ProductTag> GetAll(string keyword);

        IEnumerable<ProductTag> GetAllPaging(int page, int pageSize, out int totalRow);

        ProductTag GetByID(int productID, string TagID);

        IEnumerable<ProductTag> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ProductTagService : IProductTagService
    {
        private IProductTagRepository _productTagRepository;

        private IUnitOfWork _unitOfWork;

        public ProductTagService(IProductTagRepository productTagRepository, IUnitOfWork unitOfWork)
        {
            this._productTagRepository = productTagRepository;
            this._unitOfWork = unitOfWork;
        }

        public ProductTag Add(ProductTag productTag)
        {
            return _productTagRepository.Add(productTag);
        }

        public void Delete(int id)
        {
            _productTagRepository.Delete(id);
        }

        public IEnumerable<ProductTag> GetAll()
        {
            return _productTagRepository.GetAll(new string[] { "Products", "Tags" });
        }

        public IEnumerable<ProductTag> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _productTagRepository.GetAll();
            else return _productTagRepository.GetMulti(x => x.ProductID.ToString()
            .Contains(keyword) || x.TagID.Contains(keyword));
        }

        public IEnumerable<ProductTag> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _productTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<ProductTag> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _productTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public ProductTag GetByID(int productID, string tagID)
        {
            return _productTagRepository.GetSingleByCondition(x => x.ProductID == productID && x.TagID == tagID);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(ProductTag productTag)
        {
            _productTagRepository.Update(productTag);
        }
    }
}