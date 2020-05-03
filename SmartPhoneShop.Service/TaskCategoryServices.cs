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
    public interface ITaskCategoryService
    {
        TaskCategory Add(TaskCategory taskCategory);

        void Update(TaskCategory taskCategory);

        void Delete(int id);

        IEnumerable<TaskCategory> GetAll();

        IEnumerable<TaskCategory> GetAll(string keyword);

        IEnumerable<TaskCategory> GetAllPaging(int page, int pageSize, out int totalRow);

        TaskCategory GetByID(int id);

        IEnumerable<TaskCategory> GetAllTaskCategoryPaging(int page, int pageSize, out int totalRow);

        void SaveChanges();
    }

    public class TaskCategoryService : ITaskCategoryService
    {
        private ITaskCategoryRepository _taskCategoryRepository;

        private IUnitOfWork _unitOfWork;

        public TaskCategoryService(ITaskCategoryRepository taskCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._taskCategoryRepository = taskCategoryRepository;
            this._unitOfWork = unitOfWork;
        }

        public TaskCategory Add(TaskCategory taskCategory)
        {
            return _taskCategoryRepository.Add(taskCategory);
        }

        public void Delete(int id)
        {
            _taskCategoryRepository.Delete(id);
        }

        public IEnumerable<TaskCategory> GetAll()
        {
            return _taskCategoryRepository.GetAll();
        }

        public IEnumerable<TaskCategory> GetAll(string keyword)
        {
            string[] association = { "Task" };
            return _taskCategoryRepository.GetAll(association);
        }

        public IEnumerable<TaskCategory> GetAllPaging(int page, int pageSize, out int totalRow)
        {
            return _taskCategoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public IEnumerable<TaskCategory> GetAllTaskCategoryPaging(int page, int pageSize, out int totalRow)
        {
            return _taskCategoryRepository.GetMultiPaging(null, out totalRow, page, pageSize);
        }

        public TaskCategory GetByID(int id)
        {
            return _taskCategoryRepository.GetSingleById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void Update(TaskCategory taskCategory)
        {
            _taskCategoryRepository.Update(taskCategory);
        }
    }
}