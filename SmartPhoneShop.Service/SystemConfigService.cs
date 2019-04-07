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
    public interface ISystemConfigService
    {
        SystemConfig Add(SystemConfig systemConfig);

        void Update(SystemConfig systemConfig);

        void Delete(int id);

        IEnumerable<SystemConfig> GetAll();
        IEnumerable<SystemConfig> GetAll(string keyword);

        IEnumerable<SystemConfig> GetAllPaging(int page, int pageSize, out int totalRow);

        SystemConfig GetByID(int id);

        IEnumerable<SystemConfig> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class SystemConfigsService : ISystemConfigService
    {
        private ISystemConfigRepository _systemConfigRepository;

        private IUnitOfWork _unitOfWork;

        public SystemConfigsService(ISystemConfigRepository systemConfigRepository, IUnitOfWork unitOfWork)
        {
            this._systemConfigRepository = systemConfigRepository;
            this._unitOfWork = unitOfWork;
        }

        public SystemConfig Add(SystemConfig systemConfig)
        {
            return _systemConfigRepository.Add(systemConfig);
        }

        public void Delete(int id)
        {
            _systemConfigRepository.Delete(id);
        }

        public IEnumerable<SystemConfig> GetAll()
        {
            return _systemConfigRepository.GetAll();
        }

        public IEnumerable<SystemConfig> GetAll(string keyword)
        {
            if (string.IsNullOrEmpty(keyword)) return _systemConfigRepository.GetAll();
            else return _systemConfigRepository.GetMulti(x => x.ID.ToString().Contains(keyword)
            || x.ValueString.Contains(keyword));
        }

        public IEnumerable<SystemConfig> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _systemConfigRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<SystemConfig> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _systemConfigRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public SystemConfig GetByID(int id)
        {
            return _systemConfigRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(SystemConfig systemConfig)
        {
            _systemConfigRepository.Update(systemConfig);
        }
    }
}