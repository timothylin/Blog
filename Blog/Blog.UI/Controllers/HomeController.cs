using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.Models;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class HomeController : Controller
    {
        private BlogOperations _ops;

        public ActionResult Index()
        {
            _ops = new BlogOperations();
            var vm = new HomeVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts.Where(p => p.Status == PageStatus.Approved).OrderByDescending(p => p.TimeCreated).ToList();
            vm.BlogStats = _ops.GetBlogStats().BlogStats;
            vm.Categories = _ops.GetAllCategories().Categories;

            return View(vm);
        }


    }
}