using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class PageController : Controller
    {
        private BlogOperations _ops;
        // GET: Page
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddNewPage()
        {
            var newStaticPageVM = new AddStaticPageVM();
            return View(newStaticPageVM);
        }

        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult ViewStaticPage(int id)
        {
            _ops = new BlogOperations();
            var page = _ops.GetStaticPageById(id).StaticPage;

            return View(page);
        }

        //Admin maintaining pages
        [Authorize(Roles = "Admin")]
        public ActionResult ApprovePage(int id)
        {

            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DenyPage(int id)
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DeletePage(int id)
        {
            return View();
        }
    }
}