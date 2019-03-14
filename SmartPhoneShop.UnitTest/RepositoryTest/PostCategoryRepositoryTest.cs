using Microsoft.VisualStudio.TestTools.UnitTesting;
using SmartPhoneShop.Data.Infrastructure;
using SmartPhoneShop.Data.Repositories;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartPhoneShop.UnitTest.RepositoryTest
{
    [TestClass]
    public class PostCategoryRepositoryTest
    {
        private IDbFactory _dbFactory;
        private IPostCategoryRepository _postCategoryRepository;
        private IUnitOfWork _unitOfWork;

        [TestInitialize]
        public void Initialize()
        {
            _dbFactory = new DbFactory();
            _postCategoryRepository = new PostCategoryRepository(_dbFactory);
            _unitOfWork = new UnitOfWork(_dbFactory);
        }

        [TestMethod]
        public void PostCategory_Repository_Create()
        {
            PostCategory category = new PostCategory();
            category.Name = "Test Post Category";
            category.Alias = "Test-Post-Category";
            category.CreatedDate = DateTime.Now;
            category.CreateBy = "Huy";
            category.Status = true;
            var result = _postCategoryRepository.Add(category);
            _unitOfWork.Commit();
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void PostCategory_Repository_GetAll()
        {
            var list = _postCategoryRepository.GetAll();
            Assert.IsNotNull(list);
        }

        [TestMethod]
        public void PostCategory_Repository_Update()
        {
            var postCategory = _postCategoryRepository.GetSingleById(1);
            postCategory.Name = "huy";
            _postCategoryRepository.Update(postCategory);
            _unitOfWork.Commit();
            Assert.AreNotSame("lan", postCategory.Name);
        }
    }
}