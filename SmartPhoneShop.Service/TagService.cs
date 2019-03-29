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
        void Add(Tag tag);

        void Update(Tag tag);

        void Delete(int id);

        IEnumerable<Tag> GetAll();

        IEnumerable<Tag> GetAllPaging(int page, int pageSize, out int totalRow);

        Tag GetByID(int id);

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

        public void Add(Tag tag)
        {
            _tagRepository.Add(tag);
        }

        public void Delete(int id)
        {
            _tagRepository.Delete(id);
        }

        public IEnumerable<Tag> GetAll()
        {
            return _tagRepository.GetAll();
        }

        public IEnumerable<Tag> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _tagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<Tag> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _tagRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public Tag GetByID(int id)
        {
            return _tagRepository.GetSingleById(id);
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