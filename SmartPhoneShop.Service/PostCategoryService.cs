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
    public interface IPostCategoryService
    {
        void Add(PostCategory postCategory);

        void Update(PostCategory postCategory);

        void Delete(int id);

        IEnumerable<PostCategory> GetAll();

        IEnumerable<PostCategory> GetAllPaging(int postCategory, int postCategorySize, out int totalRow);

        PostCategory GetByID(int id);

        IEnumerable<PostCategory> GetAllTagPaging(int postCategory, int postCategorySize, out int totalRow);

        void SaveChanges();
    }

    public class PostCategoryService : IPostCategoryService
    {
        private IPostCategoryRepository _postCategoryRepository;
        private IUnitOfWork _unitofwork;

        public PostCategoryService(IPostCategoryRepository postCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._postCategoryRepository = postCategoryRepository;
            this._unitofwork = unitOfWork;
        }

        public void Add(PostCategory postCategory)
        {
            _postCategoryRepository.Add(postCategory);
        }

        public void Delete(int id)
        {
            _postCategoryRepository.Delete(id);
        }

        public IEnumerable<PostCategory> GetAll()
        {
            return _postCategoryRepository.GetAll(new string[] { });
        }

        public IEnumerable<PostCategory> GetAllPaging(int postCategory, int postCategorySize, out int totalRow)
        {
            return _postCategoryRepository.GetMultiPaging(x => x.Status, out totalRow, postCategory, postCategorySize);
        }

        public IEnumerable<PostCategory> GetAllTagPaging(int postCategory, int postCategorySize, out int totalRow)
        {
            return _postCategoryRepository.GetMultiPaging(x => x.Status, out totalRow, postCategory, postCategorySize);
        }

        public PostCategory GetByID(int id)
        {
            return _postCategoryRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(PostCategory postCategory)
        {
            _postCategoryRepository.Update(postCategory);
        }
    }
}