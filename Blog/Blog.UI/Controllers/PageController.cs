using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class PageController : Controller
    {
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
    }
}