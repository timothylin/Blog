using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Blog.Data.Config;
using Blog.Models;
using Dapper;

namespace Blog.Data
{
    public class BlogRepository
    {
        public List<BlogPost> GetAllBlogPosts()
        {
            throw new NotImplementedException();
        }

        public BlogPost GetBlogPostById(int blogPostId)
        {
            throw new NotImplementedException();
        }

        public List<StaticPage> GetAllStaticPages()
        {
            throw new NotImplementedException();
        }

        public StaticPage GetStaticPageById(int staticPageId)
        {
            throw new NotImplementedException();
        }

        public List<Hashtag> GetAllHashtags()
        {
            List<Hashtag> hashtags = new List<Hashtag>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                hashtags = cn.Query<Hashtag>("select * from Hashtags").ToList();
            }

            return hashtags;
        }

        public Hashtag GetHashtagById(int hashtagId)
        {
            throw new NotImplementedException();
        }

        public List<Category> GetAllCategories()
        {
            List<Category> categories = new List<Category>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                categories = cn.Query<Category>("select * from Categories").ToList();
            }

            return categories;
        }

        public Category GetCategoryById(int categoryId)
        {
            throw new NotImplementedException();
        }

        public List<Role> GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public List<User> GetAllUsers()
        {
            throw new NotImplementedException();
        } 
    }
}
