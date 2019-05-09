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
    public interface IProductService
    {
        Product Add(Product product);

        void Update(Product product);

        void Delete(int id);

        IEnumerable<Product> GetAll();
        IEnumerable<Product> GetProductHot();

        IEnumerable<Product> GetAll(string keyword);
        IEnumerable<string> getListProductName(string name);
        ProductCategory GetProductCategory(int ProductCategoryID);
        IEnumerable<Product> GetProductWithCategory(string CategoryName);
        IEnumerable<Product> GetProductWithCategoryHome(string CategoryName);
        IEnumerable<Product> GetAllPaging(int page, int pageSize, out int totalRow);

        IEnumerable<Product> GetAllByCategory(int CategoryID, int page, int pageSize, out int totalRow);
        IEnumerable<Product> GetAllByCategoryID(int CategoryID);
        IEnumerable<Product> GetAllByCategoryIDPaging(int CategoryID, int page, int pageSize, out int totalRow);
        IEnumerable<Product> GetAllByCategoryNamePaging(string keyword, int page, int pageSize, out int totalRow);
        Product GetByID(int id);

        IEnumerable<Product> GetAllTagPaging(string tag, int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ProductService : IProductService
    {
        private IProductRepository _productRepository;

        private IProductCategoryRepository _productCategoryRepository;

        private IUnitOfWork _unitOfWork;

        public ProductService(IProductRepository productRepository, IProductCategoryRepository productCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._productCategoryRepository = productCategoryRepository;
            this._productRepository = productRepository;
            this._unitOfWork = unitOfWork;
        }

        public Product Add(Product product)
        {
            return _productRepository.Add(product);
        }

        public void Delete(int id)
        {
            _productRepository.Delete(id);
        }

        public IEnumerable<Product> GetAll()
        {
            return _productRepository.GetAll(new string[] { "ProductCategory" });
        }

        public IEnumerable<Product> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword))
                return _productRepository.GetAll();
            else
            {
                return _productRepository.GetMulti(
                    x => x.Name.Contains(keyword)
                    || x.Description.Contains(keyword)
                    || x.ID.ToString().Contains(keyword));
            }
        }

        public IEnumerable<Product> GetAllByCategory(int CategoryID, int page, int pageSize, out int totalRow)
        {
            return _productRepository.GetMultiPaging(x => x.ProductCategoryID == CategoryID
            , out totalRow, page, pageSize, new string[] { "Product" });
        }

        public IEnumerable<Product> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _productRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Product> GetAllTagPaging(string tag, int page, int pageSize, out int totalRow)
        {
            return _productRepository.GetAllByTagPaging(tag, pageSize, pageSize, out totalRow);
        }

        public Product GetByID(int id)
        {
            return _productRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Product product)
        {
            _productRepository.Update(product);
        }

        public ProductCategory GetProductCategory(int ProductCategoryID)
        {
            return _productCategoryRepository.GetSingleById(ProductCategoryID);
        }

        public IEnumerable<Product> GetProductHot()
        {
           var list= _productRepository.GetMulti(x => x.HotFlag==true);
            foreach (var item in list)
            {
                item.ProductCategory = _productCategoryRepository.GetSingleById(item.ProductCategoryID);
            }
            return list;
        }

        public IEnumerable<Product> GetProductWithCategory(string CategoryName)
        {
            var CategoryID = _productCategoryRepository.GetSingleByCondition(x => x.Name == CategoryName).ID;
            var listCategory = _productCategoryRepository.GetMulti(x => x.ID == CategoryID || x.ParentID == CategoryID);
            List<Product> listProduct=new List<Product>();
            foreach (var category in listCategory)
            {
                listProduct.AddRange(_productRepository.GetMulti(x => x.ProductCategoryID == category.ID).ToList());
            }
            return listProduct;
        }
        public IEnumerable<Product> GetProductWithCategoryHome(string CategoryName)
        {
            var CategoryID = _productCategoryRepository.GetSingleByCondition(x => x.Name == CategoryName).ID;
            var category = _productCategoryRepository.GetMulti(x => x.ParentID == CategoryID).Take(1);
            if (category.Count()==0)
            {
                category = _productCategoryRepository.GetMulti(x => x.ID == CategoryID).Take(1);
            }
            var listProduct =new List<Product>();
            foreach (var item in category)
            {
                listProduct.AddRange(_productRepository.GetMulti(x => x.ProductCategoryID == item.ID));
            }
            return listProduct;
        }

        public IEnumerable<Product> GetAllByCategoryID(int CategoryID)
        {
            var listCategory = _productCategoryRepository.GetMulti(x => x.ID == CategoryID || x.ParentID == CategoryID);
            List<Product> listProduct = new List<Product>();
            foreach (var category in listCategory)
            {
                listProduct.AddRange(_productRepository.GetMulti(x => x.ProductCategoryID == category.ID).ToList());
            }
            return listProduct;
        }

        public IEnumerable<Product> GetAllByCategoryIDPaging(int CategoryID, int page, int pageSize, out int totalRow)
        {
            List<Product> listProduct = new List<Product>();
            if (CategoryID == 1)
            {
                listProduct = _productRepository.GetAll().ToList();
                totalRow = listProduct.Count();
                return listProduct.Skip((page - 1) * pageSize).Take(pageSize);
            }
            var listCategory = _productCategoryRepository.GetMulti(x => x.ID == CategoryID 
            || x.ParentID == CategoryID).ToList();
            
            foreach (var category in listCategory)
            {
                listProduct.AddRange(_productRepository.GetMulti(x => x.ProductCategoryID == category.ID
                &&x.Status==true
                ).ToList());
            }
            totalRow = listProduct.Count();

            return listProduct.Skip((page - 1) * pageSize).Take(pageSize);
        }

        public IEnumerable<string> getListProductName(string name)
        {
          return _productRepository.GetMulti(x => x.Name.ToLower().Contains(name.ToLower()) && x.Status).Take(7).Select(x => x.Name);

        }

        public IEnumerable<Product> GetAllByCategoryNamePaging(string keyword, int page, int pageSize, out int totalRow)
        {
            List<Product> listProduct = new List<Product>();
            listProduct = _productRepository.GetMulti(x => x.Name.ToLower()
            .Contains(keyword.ToLower()) && x.Status).ToList();
            totalRow = listProduct.Count();

            return listProduct.Skip((page - 1) * pageSize).Take(pageSize);
        }
    }
}