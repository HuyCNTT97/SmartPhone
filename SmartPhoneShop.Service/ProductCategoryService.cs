﻿using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Data.Repositories;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.Service
{
    public interface IProductCategoryService
    {
        ProductCategory Add(ProductCategory productCategory);

        void Update(ProductCategory productCategory);

        void Delete(int id);

        IEnumerable<ProductCategory> GetAll();

        IEnumerable<ProductCategory> GetAll(string keyword);
        IEnumerable<ProductCategory> CheckBreadCrumb(string keyword);
        IEnumerable<ProductCategory> GetAllPaging(int page, int pageSize, out int totalRow);

        ProductCategory GetByID(int id);

        IEnumerable<ProductCategory> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class ProductCategoryService : IProductCategoryService
    {
        private IProductCategoryRepository _productCategoryRepository;

        private IUnitOfWork _unitOfWork;

        public ProductCategoryService(IProductCategoryRepository productCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._productCategoryRepository = productCategoryRepository;
            this._unitOfWork = unitOfWork;
        }

        public ProductCategory Add(ProductCategory productCategory)
        {
            return _productCategoryRepository.Add(productCategory);
        }

        public IEnumerable<ProductCategory> CheckBreadCrumb(string keyword)
        {
            List<ProductCategory> listCategory = new List<ProductCategory>();
            var id = _productCategoryRepository.GetSingleByCondition(x => x.Name == keyword).ID;
            if (id==1) return _productCategoryRepository.GetAll();
            string[] text = keyword.Split(' ');
            foreach (var item in text)
            {
                if(double.TryParse(item,out double a) == false)
                {
                    listCategory.AddRange(_productCategoryRepository.GetMulti(x => x.Name.ToLower().Contains(item.ToLower())));
                }
            }
            return listCategory;
        }

        public void Delete(int id)
        {
            _productCategoryRepository.Delete(id);
        }

        public IEnumerable<ProductCategory> GetAll()
        {
            return _productCategoryRepository.GetAll();
        }

        public IEnumerable<ProductCategory> GetAll(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
                return _productCategoryRepository.GetMulti(x => x.Name.ToLower().Contains(keyword)
                || x.MetaDescription.ToLower().Contains(keyword)
                || x.ID.ToString().Contains(keyword));
            else
            {
                return _productCategoryRepository.GetAll();
            }
        }

        public IEnumerable<ProductCategory> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _productCategoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<ProductCategory> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _productCategoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public ProductCategory GetByID(int id)
        {
            return _productCategoryRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(ProductCategory productCategory)
        {
            _productCategoryRepository.Update(productCategory);
        }
    }
}