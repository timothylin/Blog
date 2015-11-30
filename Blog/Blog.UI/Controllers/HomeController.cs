using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.UI.Models;

namespace Blog.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult NewBlogPost()
        {
            var newBlog = new NewBlogPostVM();


            return View(newBlog);
        }


        [HttpPost]
        public ActionResult NewBlogPost(NewBlogPostVM newPost)
        {

            return View("ViewNewPost", newPost.BlogPost);
        }
    }
}
