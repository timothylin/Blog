using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class AdminController : Controller
    {
        private BlogOperations _ops;
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AngAdmin()
        {
            _ops = new BlogOperations();
            var vm = new AdminVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts;
            vm.Users = _ops.GetAllUsers().Users;
            vm.Roles = _ops.GetAllRoles().IdRoles;

            return View(vm);
        }

        public ActionResult Posts()
        {
            return View();
        }

        public ActionResult Pages()
        {
            return View();
        }

        public ActionResult Users()
        {
            return View();
        }
    }
}