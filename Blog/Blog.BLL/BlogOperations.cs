using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Blog.Data;
using Blog.Data.Config;
using Blog.Models;

namespace Blog.BLL
{
    public class BlogOperations
    {
        private BlogRepository _repo;
        private Response _response;

        public BlogOperations()
        {
            _response = new Response();
            _repo = new BlogRepository();
        }

        public Response GetAllBlogPosts()
        {
            _response = new Response();
            var blogPosts = _repo.GetAllBlogPosts();

            if (blogPosts != null)
            {
                _response.Success = true;
                _response.BlogPosts = blogPosts;
            }

            return _response;
        }

        public Response GetBlogPostById(int blogPostId)
        {
            _response = new Response();
            var blogPost = _repo.GetBlogPostById(blogPostId);

            if (blogPost != null)
            {
                _response.Success = true;
                _response.BlogPost = blogPost;
            }

            return _response;
        }

        public Response UpdateBlogPostStatus(int blogPostId, BlogPostStatus updatedStatus)
        {
            _response = new Response();
            var blogPost = _repo.UpdateBlogPostStatus(blogPostId, updatedStatus);

            if (blogPost != null)
            {
                _response.Success = true;
                _response.BlogPost = blogPost;
                _response.Message = "Blog post status was successfully updated";
            }

            _response.Message = "Your blog post status could not be updated";

            return _response;
        }

        public Response UpdateStaticPageStatus(int staticPageId, BlogPostStatus updatedStaticPageStatus)
        {
            _response = new Response();
            var staticPage = _repo.UpdateStaticPageStatus(staticPageId, updatedStaticPageStatus);

            if (staticPage != null)
            {
                _response.Success = true;
                _response.StaticPage = staticPage;
                _response.Message = "Static page status was successfully updated";
            }

            _response.Message = "Your static page status could not be updated";

            return _response;
        }

        public Response AddNewBlogPost(BlogPost b)
        {
            _response = new Response();
            var blogPost = _repo.AddNewBlogPost(b);

            if (blogPost != null)
            {
                _response.Success = true;
                _response.BlogPost = blogPost;
            }

            return _response;
        }

        public Response AddNewStaticPage(StaticPage p)
        {
            _response = new Response();
            var staticPage = _repo.AddNewStaticPage(p);

            if (staticPage != null)
            {
                _response.Success = true;
                _response.StaticPage = staticPage;
            }

            return _response;
        }

        public Response GetAllStaticPages()
        {
            _response = new Response();
            var staticPages = _repo.GetAllStaticPages();

            if (staticPages != null)
            {
                _response.Success = true;
                _response.StaticPages = staticPages;
            }

            return _response;
        }

        public Response GetStaticPageById(int staticPageId)
        {
            _response = new Response();
            var staticPage = _repo.GetStaticPageById(staticPageId);

            if (staticPage != null)
            {
                _response.Success = true;
                _response.StaticPage = staticPage;
            }

            return _response;
        }

        public Response GetAllHashtags()
        {
            _response = new Response();
            var hashtags = _repo.GetAllHashtags();

            if (hashtags != null)
            {
                _response.Success = true;
                _response.Hashtags = hashtags;
            }

            return _response;
        }

        public Response GetHashtagById(int hashtagId)
        {
            _response = new Response();
            var hashtag = _repo.GetHashtagById(hashtagId);

            if (hashtag != null)
            {
                _response.Success = true;
                _response.Hashtag = hashtag;
            }

            return _response;
        }

        public Response GetAllCategories()
        {
            _response = new Response();
            var categories = _repo.GetAllCategories();

            if (categories != null)
            {
                _response.Success = true;
                _response.Categories = categories;
            }

            return _response;
        }

        public Response GetCategoryById(int categoryId)
        {
            _response = new Response();
            var category = _repo.GetCategoryById(categoryId);

            if (category != null)
            {
                _response.Success = true;
                _response.Category = category;
            }

            return _response;
        }

        public Response GetAllRoles()
        {
            _response = new Response();
            var idRoles = _repo.GetAllRoles();

            if (idRoles != null)
            {
                _response.Success = true;
                _response.IdRoles = idRoles;
            }

            return _response;
        }

        public Response GetAllUsers()
        {
            _response = new Response();
            var users = _repo.GetAllUsers();

            if (users != null)
            {
                _response.Success = true;
                _response.Users = users;
            }

            return _response;
        }

        public Response AddRoleToUser(string userId, string roleId)
        {
            _response = new Response();
            var user = _repo.AddRoleToUser(userId, roleId);

            if (user != null && user.Roles.First().RoleId == roleId)
            {
                _response.Success = true;
                _response.User = user;

            }

            return _response;

        }

        public Response GetUserById(string userId)
        {
            _response = new Response();
            var user = _repo.GetUserById(userId);

            if (user != null)
            {
                _response.Success = true;
                _response.User = user;
            }

            return _response;

        }

        public Response UpdateRoleByUserId(string userId, string roleId)
        {
            _response = new Response();
            var user = _repo.UpdateRoleByUserId(userId, roleId);

            if (user != null && user.Roles.First().RoleId == roleId)
            {
                _response.Success = true;
                _response.User = user;
            }

            return _response;
        }

        public Response UpdateUserAccountStatus(string userId, AccountStatus status)
        {
            _response = new Response();
            var user = _repo.UpdateUserAccountStatus(userId, status);

            if (user != null && user.AccountStatus == status)
            {
                _response.Success = true;
                _response.User = user;
            }

            return _response;

        }


    }
}
