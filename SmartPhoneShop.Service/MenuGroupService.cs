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
    public interface IMenuGroupService
    {
        MenuGroup Add(MenuGroup menuGroup);

        void Update(MenuGroup menuGroup);

        void Delete(int id);

        IEnumerable<MenuGroup> GetAll();

        IEnumerable<MenuGroup> GetAllPaging(int page, int pageSize, out int totalRow);

        MenuGroup GetByID(int id);

        IEnumerable<MenuGroup> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class MenuGroupService : IMenuGroupService
    {
        private IMenuGroupRepository _menuGroupRepository;

        private IUnitOfWork _unitofwork;

        public MenuGroupService(IMenuGroupRepository menuGroupRepository, IUnitOfWork unitOfWork)
        {
            this._menuGroupRepository = menuGroupRepository;
            this._unitofwork = unitOfWork;
        }

        public MenuGroup Add(MenuGroup menuGroup)
        {
            return _menuGroupRepository.Add(menuGroup);
        }

        public void Delete(int id)
        {
            _menuGroupRepository.Delete(id);
        }

        public IEnumerable<MenuGroup> GetAll()
        {
            return _menuGroupRepository.GetAll();
        }

        public IEnumerable<MenuGroup> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _menuGroupRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<MenuGroup> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _menuGroupRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public MenuGroup GetByID(int id)
        {
            return _menuGroupRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(MenuGroup menuGroup)
        {
            _menuGroupRepository.Update(menuGroup);
        }
    }
}