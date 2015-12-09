using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.BLL;
using Blog.Models;
using Blog.UI.Models;
using Microsoft.AspNet.Identity;

namespace Blog.UI.Controllers
{
    public class PageController : Controller
    {
        private BlogOperations _ops;

        public PageController()
        {
            _ops = new BlogOperations();
        }

        // GET: Page
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin, PR")]
        public ActionResult AddNewPage()
        {
            var newStaticPageVM = new AddStaticPageVM();
            newStaticPageVM.StaticPage.User.Id = User.Identity.GetUserId();

            return View(newStaticPageVM);
        }

        [HttpPost]
        [Authorize(Roles = "Admin, PR")]
        public ActionResult AddNewPage(AddStaticPageVM newPage)
        {
            if (ModelState.IsValid)
            {
                newPage.StaticPage.User.UserName = User.Identity.GetUserName();
                newPage.StaticPage.TimeCreated = DateTime.Now;
                newPage.StaticPage.Status = PageStatus.Pending;

                if (User.IsInRole("Admin"))
                {
                    newPage.StaticPage.Status = PageStatus.Approved;
                }

                var page = _ops.AddNewStaticPage(newPage.StaticPage).StaticPage;

                return View("StaticPageDetails", page);
            }

            return View(newPage);

        }

        [Authorize(Roles = "Admin")]
        public ActionResult EditStaticPage(int id)
        {
            var vm = new AddStaticPageVM();

            vm.StaticPage = _ops.GetStaticPageById(id).StaticPage;

            return View(vm);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult EditStaticPage(AddStaticPageVM vm)
        {
            if (ModelState.IsValid)
            {
                var page = _ops.EditStaticPage(vm.StaticPage).StaticPage;

                return View("StaticPageDetails", page);
            }

            return View(vm);

        }

        public ActionResult ViewStaticPage(int id)
        {
            var page = _ops.GetStaticPageById(id).StaticPage;

            return View(page);
        }

        //Admin maintaining pages
        [Authorize(Roles = "Admin")]
        public ActionResult ApprovePage(int id)
        {
            _ops.UpdateStaticPageStatus(id, PageStatus.Approved);

            return RedirectToAction("ManageStaticPages", "Admin");

        }

        [Authorize(Roles = "Admin")]
        public ActionResult DenyPage(int id)
        {
            _ops.UpdateStaticPageStatus(id, PageStatus.Denied);

            return RedirectToAction("ManageStaticPages", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DeletePage(int id)
        {
            _ops.UpdateStaticPageStatus(id, PageStatus.Deleted);

            return RedirectToAction("ManageStaticPages", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult RestorePage(int id)
        {
            _ops.UpdateStaticPageStatus(id, PageStatus.Pending);

            return RedirectToAction("ManageStaticPages", "Admin");
        }
    }
}