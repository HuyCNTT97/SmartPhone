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
    public interface ISystemConfigsService
    {
        SystemConfigs Add(SystemConfigs systemConfig);

        void Update(SystemConfigs systemConfig);

        void Delete(int id);

        IEnumerable<SystemConfigs> GetAll();

        IEnumerable<SystemConfigs> GetAllPaging(int page, int pageSize, out int totalRow);

        SystemConfigs GetByID(int id);

        IEnumerable<SystemConfigs> GetAllTagPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class SystemConfigsService : ISystemConfigsService
    {
        private ISystemConfigRepository _systemConfigRepository;
        private IUnitOfWork _unitOfWork;

        public SystemConfigs Add(SystemConfigs systemConfig)
        {
            return _systemConfigRepository.Add(systemConfig);
        }

        public void Delete(int id)
        {
            _systemConfigRepository.Delete(id);
        }

        public IEnumerable<SystemConfigs> GetAll()
        {
            return _systemConfigRepository.GetAll();
        }

        public IEnumerable<SystemConfigs> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _systemConfigRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<SystemConfigs> GetAllTagPaging(int page, int pageSize, out int totalRow)
        {
            return _systemConfigRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public SystemConfigs GetByID(int id)
        {
            return _systemConfigRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(SystemConfigs systemConfig)
        {
            _systemConfigRepository.Update(systemConfig);
        }
    }
}