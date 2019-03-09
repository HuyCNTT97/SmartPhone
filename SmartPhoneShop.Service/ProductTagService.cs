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
        void Add(ProductTag productTag);

        void Update(ProductTag productTag);

        void Delete(int id);

        IEnumerable<ProductTag> GetAll();

        IEnumerable<ProductTag> GetAllPaging(int page, int pageSize, out int totalRow);

        ProductTag GetByID(int id);

        IEnumerable<ProductTag> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ProductTagService : IProductTagService
    {
        private IProductTagRepository _productTagRepository;
        private IUnitOfWork _unitOfWork;

        public void Add(ProductTag productTag)
        {
            _productTagRepository.Add(productTag);
        }

        public void Delete(int id)
        {
            _productTagRepository.Delete(id);
        }

        public IEnumerable<ProductTag> GetAll()
        {
            return _productTagRepository.GetAll(new string[] { "Products", "Tags" });
        }

        public IEnumerable<ProductTag> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _productTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<ProductTag> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _productTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public ProductTag GetByID(int id)
        {
            return _productTagRepository.GetSingleById(id);
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