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
        // GET: Page
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult AddNewPage()
        {
            var newStaticPageVM = new AddStaticPageVM();
            newStaticPageVM.StaticPage.User.Id = User.Identity.GetUserId();

            return View(newStaticPageVM);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult AddNewPage(AddStaticPageVM newPage)
        {
            _ops = new BlogOperations();

            if (ModelState.IsValid)
            {
                newPage.StaticPage.User.UserName = User.Identity.GetUserName();
                newPage.StaticPage.TimeCreated = DateTime.Now;
                newPage.StaticPage.Status = Status.Approved;

                var page = _ops.AddNewStaticPage(newPage.StaticPage).StaticPage;

                return View("StaticPageDetails", page);
            }
            else
            {
                return View(newPage);
            }

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