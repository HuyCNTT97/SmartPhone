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
    public interface IPostTagService
    {
        PostTag Add(PostTag postTag);

        void Update(PostTag postTag);

        void Delete(int id);

        IEnumerable<PostTag> GetAll();

        IEnumerable<PostTag> GetAllPaging(int postTag, int postTagSize, out int totalRow);

        PostTag GetByID(int id);

        IEnumerable<PostTag> GetAllTagPaging(int postTag, int postTagSize, out int totalRow);

        void SaveChanges();
    }

    public class PostTagService : IPostTagService
    {
        private IPostTagRepository _postTagRepository;
        private IUnitOfWork _unitofwork;

        public PostTagService(IPostTagRepository postTagRepository, IUnitOfWork unitOfWork)
        {
            this._postTagRepository = postTagRepository;
            this._unitofwork = unitOfWork;
        }

        public PostTag Add(PostTag postTag)
        {
            return _postTagRepository.Add(postTag);
        }

        public void Delete(int id)
        {
            _postTagRepository.Delete(id);
        }

        public IEnumerable<PostTag> GetAll()
        {
            return _postTagRepository.GetAll(new string[] { "Tags", "Posts" });
        }

        public IEnumerable<PostTag> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _postTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<PostTag> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _postTagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public PostTag GetByID(int id)
        {
            return _postTagRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(PostTag postTag)
        {
            _postTagRepository.Update(postTag);
        }
    }
}