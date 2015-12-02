using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class BlogPostController : Controller
    {
        // GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddNewBlogPost()
        {
            var newBlogPostVM = new AddBlogPostVM();
            return View(newBlogPostVM);
        }
    }
}