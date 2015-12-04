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
        private BlogOperations _ops;
        
        // GET: BlogPost
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin, PR")]
        public ActionResult AddNewBlogPost()
        {
            _ops = new BlogOperations();

            var newBlogPostVM = new AddBlogPostVM();
            newBlogPostVM.BlogPost.User.Id = User.Identity.GetUserId();
            
            newBlogPostVM.InitializeCategoriesList(_ops.GetAllCategories().Categories);

            return View(newBlogPostVM);

        }

        [Authorize(Roles = "Admin, PR")]
        [HttpPost]
        public ActionResult AddNewBlogPost(AddBlogPostVM newPost)
        {
            _ops = new BlogOperations();
            newPost.BlogPost.User.UserName = User.Identity.GetUserName();
            newPost.BlogPost.TimeCreated = DateTime.Now;
            newPost.BlogPost.Status = Status.Pending;

            if (User.IsInRole("Admin"))
            {
                newPost.BlogPost.Status = Status.Approved;
            }

            foreach (var ht in newPost.hashtags)
            {
                var newTag = new Hashtag();
                newTag.HashtagTitle = ht;
                newPost.BlogPost.Hashtags.Add(newTag);
            }

            //newPost.BlogPost.Category.CategoryTitle = _ops.GetCategoryById(newPost.BlogPost.Category.CategoryId).Category.CategoryTitle;

            var post = _ops.AddNewBlogPost(newPost.BlogPost).BlogPost;

            return View("BlogPostDetails", post);

            //Ajax API call for confirmation modal


        }

        //[Authorize(Roles = "Admin, PR")]
        //[HttpPost]
        //public ActionResult SubmitBlogPost(BlogPost newPost)
        //{
        //    return RedirectToAction("Index", "Home");
        //}
    }
}