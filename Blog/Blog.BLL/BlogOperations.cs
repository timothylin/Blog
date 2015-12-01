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
            var roles = _repo.GetAllRoles();

            if (roles != null)
            {
                _response.Success = true;
                _response.Roles = roles;
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
    }
}
