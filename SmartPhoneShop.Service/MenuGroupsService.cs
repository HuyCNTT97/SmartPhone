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
    public interface IMenuGroupsService
    {
        void Add(MenuGroups menuGroup);

        void Update(MenuGroups menuGroup);

        void Delete(int id);

        IEnumerable<MenuGroups> GetAll();

        IEnumerable<MenuGroups> GetAllPaging(int page, int pageSize, out int totalRow);

        MenuGroups GetByID(int id);

        IEnumerable<MenuGroups> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class MenuGroupsService : IMenuGroupsService
    {
        private IMenuGroupRepository _menuGroupRepository;
        private IUnitOfWork _unitofwork;

        public MenuGroupsService(IMenuGroupRepository menuGroupRepository, IUnitOfWork unitOfWork)
        {
            this._menuGroupRepository = menuGroupRepository;
            this._unitofwork = unitOfWork;
        }

        public void Add(MenuGroups menuGroup)
        {
            _menuGroupRepository.Add(menuGroup);
        }

        public void Delete(int id)
        {
            _menuGroupRepository.Delete(id);
        }

        public IEnumerable<MenuGroups> GetAll()
        {
            return _menuGroupRepository.GetAll();
        }

        public IEnumerable<MenuGroups> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _menuGroupRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<MenuGroups> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _menuGroupRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public MenuGroups GetByID(int id)
        {
            return _menuGroupRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(MenuGroups menuGroup)
        {
            _menuGroupRepository.Update(menuGroup);
        }
    }
}