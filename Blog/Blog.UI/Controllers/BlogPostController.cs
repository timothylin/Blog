using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ApplicationServices;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Blog.BLL;
using Blog.Models;
using Blog.UI.Models;
using Microsoft.AspNet.Identity;

namespace Blog.UI.Controllers
{
    public class BlogPostController : Controller
    {
        private BlogOperations _ops;
        private JavaScriptSerializer _jss;

        public BlogPostController()
        {
            _ops = new BlogOperations();
            _jss = new JavaScriptSerializer();
        }

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

            newBlogPostVM.InitializeCategoriesList(_ops.GetAllCategories().Categories);

            return View(newBlogPostVM);

        }

        [Authorize(Roles = "Admin, PR")]
        [HttpPost]
        public ActionResult AddNewBlogPost(AddBlogPostVM newPost)
        {
            if (ModelState.IsValid)
            {

                newPost.BlogPost.User.UserName = User.Identity.GetUserName();
                newPost.BlogPost.TimeCreated = DateTime.Now;
                newPost.BlogPost.Status = PageStatus.Pending;

                if (User.IsInRole("Admin"))
                {
                    newPost.BlogPost.Status = PageStatus.Approved;
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

            newPost.InitializeCategoriesList(_ops.GetAllCategories().Categories);

            return View(newPost);
        }

        //Edit Blog Post
        [Authorize(Roles = "Admin")]
        public ActionResult EditBlogPost(int id)
        {
            var editVm = new AddBlogPostVM();
            editVm.BlogPost = _ops.GetBlogPostById(id).BlogPost;
            editVm.InitializeCategoriesList(_ops.GetAllCategories().Categories);

            return View(editVm);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public ActionResult EditBlogPost(AddBlogPostVM vm)
        {
            if (ModelState.IsValid)
            {
                foreach (var ht in vm.hashtags)
                {
                    var newTag = new Hashtag();
                    newTag.HashtagTitle = ht;
                    vm.BlogPost.Hashtags.Add(newTag);
                }

                var oldHashtags = _jss.Serialize(_ops.GetHashtagsByBlogPostId(vm.BlogPost.BlogPostId).Hashtags.OrderBy(h => h.HashtagTitle).Select(h => h.HashtagTitle));

                var newHashtags = _jss.Serialize(vm.BlogPost.Hashtags.OrderBy(h => h.HashtagTitle).Select(h => h.HashtagTitle));

                if (oldHashtags != newHashtags)
                {
                    vm.BlogPost.HashtagsUpdated = true;
                }

                var blogPost = _ops.EditBlogPost(vm.BlogPost).BlogPost;

                return View("BlogPostDetails", blogPost);

            }

            vm.InitializeCategoriesList(_ops.GetAllCategories().Categories);

            return View(vm);

        }

        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult ViewBlogPost(int id)
        {
            var post = _ops.GetBlogPostById(id).BlogPost;

            return View(post);
        }

        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult AllPosts(int id)
        {
            _ops = new BlogOperations();
            var vM = new AllPostsVM();
            var allPosts = _ops.GetAllBlogPosts().BlogPosts.Where(p => p.Status == PageStatus.Approved).OrderByDescending(p => p.TimeCreated).ToList();
            vM.PostCount = allPosts.Count;
            vM.CurrentPage = id;
            decimal totalPages = (allPosts.Count / 5) + 1;

            vM.TotalPages = decimal.ToInt32(totalPages);

            if (id < vM.TotalPages)
            {
                for (int i = 5 * (id - 1); i < 5 * id; i++)
                {
                    vM.BlogPosts.Add(allPosts[i]);
                }
            }
            else if (id == vM.TotalPages)
            {
                for (int i = 5 * (id - 1); i < ((5 * (id - 1)) + (vM.PostCount % 5)); i++)
                {
                    vM.BlogPosts.Add(allPosts[i]);
                }
            }

            vM.Categories = _ops.GetAllCategories().Categories;

            return View("AllPosts", vM);
        }

        //View Posts in a Category
        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult ViewCategory(int id)
        {
            _ops = new BlogOperations();
            var vM = new ViewCategoryVM();
            vM.BlogPosts = _ops.GetAllBlogPosts().BlogPosts.Where(p => p.Category.CategoryId == id).OrderByDescending(p => p.TimeCreated).ToList();

            vM.Categories = _ops.GetAllCategories().Categories;
            vM.CurrentCategory.CategoryId = id;
            vM.CurrentCategory.CategoryTitle = _ops.GetCategoryById(id).Category.CategoryTitle;

            return View("ViewCategory", vM);
        }

        //Search Posts
        [Authorize(Roles = "Admin, PR, User")]
        public ActionResult SearchPosts()
        {
            _ops = new BlogOperations();
            var vM = new AllPostsVM();
            vM.BlogPosts =
                _ops.GetAllBlogPosts()
                    .BlogPosts.Where(p => p.Status == PageStatus.Approved)
                    .OrderBy(p => p.BlogPostTitle)
                    .ToList();
            vM.Categories = _ops.GetAllCategories().Categories;

            return View("SearchPosts", vM);
        }


        //Admin maintaining posts
        [Authorize(Roles = "Admin")]
        public ActionResult ApprovePost(int id)
        {
            _ops.UpdateBlogPostStatus(id, PageStatus.Approved);

            return RedirectToAction("ManagePosts", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DenyPost(int id)
        {
            _ops.UpdateBlogPostStatus(id, PageStatus.Denied);

            return RedirectToAction("ManagePosts", "Admin"); ;
        }

        [Authorize(Roles = "Admin")]
        public ActionResult DeletePost(int id)
        {
            _ops.UpdateBlogPostStatus(id, PageStatus.Deleted);

            return RedirectToAction("ManagePosts", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult RestorePost(int id)
        {
            _ops.UpdateBlogPostStatus(id, PageStatus.Pending);

            return RedirectToAction("ManagePosts", "Admin");
        }



    }
}