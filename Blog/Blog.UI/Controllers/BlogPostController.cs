using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.UI.Models;
using Microsoft.AspNet.Identity;

namespace Blog.UI.Controllers
{
    public class BlogPostController : Controller
    {
        // GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult AddNewBlogPost()
        {
            var newBlogPostVM = new AddBlogPostVM();
            newBlogPostVM.BlogPost.User.Id = User.Identity.GetUserId();

            return View(newBlogPostVM);


        }
    }
}