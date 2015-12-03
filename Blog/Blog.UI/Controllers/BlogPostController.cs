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
    public class BlogPostController : Controller
    {
        // GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin, PR")]
        public ActionResult AddNewBlogPost()
        {
            var newBlogPostVM = new AddBlogPostVM();
            newBlogPostVM.BlogPost.User.Id = User.Identity.GetUserId();

            return View(newBlogPostVM);

        }

        [Authorize(Roles = "Admin, PR")]
        [HttpPost]
        public ActionResult AddNewBlogPost(AddBlogPostVM newPost)
        {
            //newPost.BlogPost.TimeCreated = DateTime.Now;

            //repo submit post




            return View("ConfirmBlogPost", newPost.BlogPost);




        }

        [Authorize(Roles = "Admin, PR")]
        [HttpPost]
        public ActionResult SubmitBlogPost(BlogPost newPost)
        {
            //repo method to submit to library
            newPost.TimeCreated = DateTime.Now;

            var ops = new BlogOperations();

            var response = ops.AddNewBlogPost(newPost);

            if (response.Success)
            {
                return View("Index");
            }

            return RedirectToAction("Index", "Home");
        }
    }
}