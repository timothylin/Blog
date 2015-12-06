using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class PRController : Controller
    {
        private BlogOperations _ops;
        // GET: PR
        public ActionResult PRDashboard()
        {
            _ops = new BlogOperations();
            var vm = new PRVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts;
            return View(vm);
        }
    }
}