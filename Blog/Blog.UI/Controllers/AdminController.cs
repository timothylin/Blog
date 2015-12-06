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
        public ActionResult AdminDashboard()
        {
            _ops = new BlogOperations();
            var vm = new AdminVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts;
            vm.Users = _ops.GetAllUsers().Users;
            vm.Roles = _ops.GetAllRoles().IdRoles;

            return View(vm);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult AdminPosts()
        {
            _ops = new BlogOperations();
            var vm = new AdminVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts;
            vm.Users = _ops.GetAllUsers().Users;
            vm.Roles = _ops.GetAllRoles().IdRoles;


            return View("AdminPosts", vm);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult AdminPages()
        {
            _ops = new BlogOperations();
            var vm = new AdminVM();
            vm.Pages = _ops.GetAllStaticPages().StaticPages;
            vm.Users = _ops.GetAllUsers().Users;
            vm.Roles = _ops.GetAllRoles().IdRoles;

            return View("AdminPages", vm);
        }
    }
}