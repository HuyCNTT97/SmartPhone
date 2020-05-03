using SmartPhoneShop.Common;
using SmartPhoneShop.Model.Model;
using SmartPhoneShop.Service;
using SmartPhoneShop.Web.Infrasture.ActionFilter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace SmartPhoneShop.Web.Controllers
{
    
    public class TaskCategoryController : Controller
    {
        private ITaskCategoryService _taskCategoryService;

        public TaskCategoryController(ITaskCategoryService taskCategoryService)
        {
            _taskCategoryService = taskCategoryService;
        }
        [RequiredLogin]
        // GET: TaskCategory
        public ActionResult Index()
        {
            var taskCategories = _taskCategoryService.GetAll().ToList();
            return View(taskCategories);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(TaskCategory taskCategory)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "form body invalid");
                return View();
            }
            try
            {
                _taskCategoryService.Add(taskCategory);
                _taskCategoryService.SaveChanges();
                TempData["msg"] = MessageBox.Show("created successly");
            }
            catch (Exception e)
            {
                TempData["msg"] = MessageBox.Show("Error: " + e);
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var taskCategory = _taskCategoryService.GetByID(id);
            return View(taskCategory);
        }
        [HttpPost]
        public ActionResult Edit(int id, TaskCategory EdittedTaskCategory)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError("", "form body invalid");
                return View();
            }
            try
            {
                EdittedTaskCategory.ID = id;
                _taskCategoryService.Update(EdittedTaskCategory);
                _taskCategoryService.SaveChanges();
                TempData["msg"] = MessageBox.Show("Edit successfully");
            }
            catch (Exception e)
            {
                TempData["msg"] = MessageBox.Show("Error: " + e);
            }
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public JsonResult Delete(int id)
        {
            try
            {
                _taskCategoryService.Delete(id);
                _taskCategoryService.SaveChanges();
                return Json(new
                {
                    message = "delete success"
                });
            }
            catch (Exception e)
            {
                return Json(new
                {
                    message = "delete fail"
                });
            }
        }
    }
}