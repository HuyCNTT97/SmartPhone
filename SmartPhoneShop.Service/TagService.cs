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
    public interface ITagService
    {
        Tag Add(Tag tag);

        void Update(Tag tag);

        void Delete(int id);

        IEnumerable<Tag> GetAll();

        IEnumerable<Tag> GetAll(string keyword);

        IEnumerable<Tag> GetAllPaging(int page, int pageSize, out int totalRow);

        Tag GetByID(string id);

        IEnumerable<Tag> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class TagService : ITagService
    {
        private ITagRepository _tagRepository;

        private IUnitOfWork _unitOfWork;

        public TagService(ITagRepository tagRepository, IUnitOfWork unitOfWork)
        {
            this._tagRepository = tagRepository;
            this._unitOfWork = unitOfWork;
        }

        public Tag Add(Tag tag)
        {
            return _tagRepository.Add(tag);
        }

        public void Delete(int id)
        {
            _tagRepository.Delete(id);
        }

        public IEnumerable<Tag> GetAll()
        {
            return _tagRepository.GetAll();
        }

        public IEnumerable<Tag> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _tagRepository.GetAll();
            else return _tagRepository.GetMulti(x => x.Name.Contains(keyword)
            || x.ID.ToString().Contains(keyword));
        }

        public IEnumerable<Tag> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _tagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Tag> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _tagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Tag GetByID(string id)
        {
            return _tagRepository.GetSingleByCondition(x => x.ID == id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(Tag tag)
        {
            _tagRepository.Update(tag);
        }
    }
}