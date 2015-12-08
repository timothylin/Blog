using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ApplicationServices;
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

            if (ModelState.IsValid)
            {
                
                newPost.BlogPost.User.UserName = User.Identity.GetUserName();
                newPost.BlogPost.TimeCreated = DateTime.Now;
                newPost.BlogPost.Status = BlogPostStatus.Pending;

                if (User.IsInRole("Admin"))
                {
                    newPost.BlogPost.Status = BlogPostStatus.Approved;
                }

                foreach (var ht in newPost.hashtags)
                {
                    var newTag = new Hashtag();
                    newTag.HashtagTitle = ht;
                    newPost.BlogPost.Hashtags.Add(newTag);
                }

                var post = _ops.AddNewBlogPost(newPost.BlogPost).BlogPost;

                return View("BlogPostDetails", post);

                //Ajax API call for confirmation modal
            }
            else
            {
                newPost.InitializeCategoriesList(_ops.GetAllCategories().Categories);
                return View(newPost);
            }
        }

       
        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult ViewBlogPost(int id)
        {
            _ops = new BlogOperations();
            var post = _ops.GetBlogPostById(id).BlogPost;

            return View(post);
        }

        //User as well?
        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult AllPosts()
        {
            _ops = new BlogOperations();
            var vm = new HomeVM();
            vm.BlogPosts = _ops.GetAllBlogPosts().BlogPosts.Where(p => p.Status == BlogPostStatus.Approved).ToList();
            return View("AllPosts", vm);

        }


        //Admin maintaining posts
        [Authorize(Roles = "Admin")]
        public ActionResult ApprovePost(int id)
        {
            _ops = new BlogOperations();
            var update = _ops.UpdateBlogPostStatus(id, BlogPostStatus.Approved);

            return RedirectToAction("ManagePosts", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DenyPost(int id)
        {
            _ops = new BlogOperations();
            var update = _ops.UpdateBlogPostStatus(id, BlogPostStatus.Denied);

            return RedirectToAction("ManagePosts", "Admin"); ;
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DeletePost(int id)
        {
            _ops = new BlogOperations();
            var update = _ops.UpdateBlogPostStatus(id, BlogPostStatus.Deleted);

            return RedirectToAction("ManagePosts", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult RestorePost(int id)
        {
            _ops = new BlogOperations();
            var update = _ops.UpdateBlogPostStatus(id, BlogPostStatus.Pending);

            return RedirectToAction("ManagePosts", "Admin");
        }



    }
}