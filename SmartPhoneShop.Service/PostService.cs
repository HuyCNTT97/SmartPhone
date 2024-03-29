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
    public interface IPostService
    {
        Post Add(Post post);

        void Update(Post post);

        void Delete(int id);

        IEnumerable<Post> GetAll();

        IEnumerable<Post> GetAll(string keyword);

        IEnumerable<Post> GetAllPaging(int page, int pageSize, out int totalRow);

        IEnumerable<Post> GetAllByCategory(int CategoryID, int page, int pageSize, out int totalRow);

        Post GetByID(int id);

        string GetNamePostCategory(int PostCategoryID);

        IEnumerable<Post> GetAllTagPaging(string tag, int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class PostService : IPostService
    {
        private IPostRepository _postRepository;

        private IPostCategoryRepository _postCategoryRepository;

        private IUnitOfWork _unitofwork;

        public PostService(IPostRepository postRepository,
            IPostCategoryRepository postCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._postCategoryRepository = postCategoryRepository;
            this._postRepository = postRepository;
            this._unitofwork = unitOfWork;
        }

        public Post Add(Post post)
        {
            return _postRepository.Add(post);
        }

        public void Delete(int id)
        {
            _postRepository.Delete(id);
        }

        public IEnumerable<Post> GetAll()
        {
            return _postRepository.GetAll(new string[] { "PostCategory" });
        }

        public IEnumerable<Post> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _postRepository.GetAll();
            else
            {
                return _postRepository.GetMulti(x => x.Name.ToLower().Contains(keyword)
                || x.ID.ToString().Contains(keyword));
            }
        }

        public IEnumerable<Post> GetAllByCategory(int CategoryID, int page, int pageSize, out int totalRow)
        {
            return _postRepository.GetMultiPaging(x => x.Status && x.PostCategoryID == CategoryID, out totalRow, page, pageSize
                , new string[] { "PostCategory" });
        }

        public IEnumerable<Post> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _postRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Post> GetAllTagPaging(string tag, int pageIndex, int pageSize, out int totalRow)
        {
            return _postRepository.GetAllTag(tag, pageIndex, pageSize, out totalRow);
        }

        public Post GetByID(int id)
        {
            return _postRepository.GetSingleById(id);
        }

        public string GetNamePostCategory(int PostCategoryID)
        {
            return _postCategoryRepository.GetSingleById(PostCategoryID).Name;
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(Post post)
        {
            _postRepository.Update(post);
        }
    }
}