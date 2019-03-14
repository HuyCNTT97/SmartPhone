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
    public interface IMenuService
    {
        Menu Add(Menu menu);

        void Update(Menu menu);

        void Delete(int id);

        IEnumerable<Menu> GetAll();

        IEnumerable<Menu> GetAllPaging(int page, int pageSize, out int totalRow);

        Menu GetByID(int id);

        IEnumerable<Menu> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class MenuService : IMenuService
    {
        private IMenuRepository _menuRepository;
        private IUnitOfWork _unitofwork;

        public MenuService(IMenuRepository menuRepository, IUnitOfWork unitOfWork)
        {
            this._menuRepository = menuRepository;
            this._unitofwork = unitOfWork;
        }

        public Menu Add(Menu menu)
        {
            return _menuRepository.Add(menu);
        }

        public void Delete(int id)
        {
            _menuRepository.Delete(id);
        }

        public IEnumerable<Menu> GetAll()
        {
            return _menuRepository.GetAll(new string[] { "MenuGroups" });
        }

        public IEnumerable<Menu> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _menuRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public IEnumerable<Menu> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _menuRepository.GetMultiPaging(x => x.Status, out totalRow, page, pageSize);
        }

        public Menu GetByID(int id)
        {
            return _menuRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitofwork.Commit();
        }

        public void Update(Menu menu)
        {
            _menuRepository.Update(menu);
        }
    }
}