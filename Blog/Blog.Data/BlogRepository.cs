using System;
using System.Collections.Generic;
using System.Data;
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
            List<BlogPost> blogPosts = new List<BlogPost>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from BlogPosts";
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPosts.Add(PopulateBlogPostFromReader(dr));
                    }
                }
            }

            return blogPosts;
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
            List<Role> roles = new List<Role>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                roles = cn.Query<Role>("select * from AspNetRoles").ToList();
            }

            return roles;

        }

        public List<User> GetAllUsers()
        {
            List<User> users = new List<User>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetAllUsers";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        users.Add(PopulateUserDataFromReader(dr));
                    }
                }
            }

            return users;
        }

        private User PopulateUserDataFromReader(SqlDataReader dr)
        {
            User user = new User();

            user.Id = dr["UserID"].ToString();
            user.Role.Id = dr["RoleID"].ToString();
            user.Role.Name = dr["RoleName"].ToString();
            user.Email = dr["Email"].ToString();
            user.FirstName = dr["FirstName"].ToString();
            user.LastName = dr["LastName"].ToString();
            user.UserName = dr["UserName"].ToString();

            return user;
        }


        private BlogPost PopulateBlogPostFromReader(SqlDataReader dr)
        {
            BlogPost blogPost = new BlogPost();

            blogPost.BlogPostId = (int) dr["BlogPostID"];
            blogPost.BlogPostTitle = dr["BlogPostTitle"].ToString();
            blogPost.BlogPostText = dr["BlogPostText"].ToString();
            blogPost.TimeCreated = DateTime.Parse(dr["TimeCreated"].ToString());
            if (dr["ExpirationDate"] != DBNull.Value)
            {
                blogPost.ExpirationDate = DateTime.Parse(dr["ExpirationDate"].ToString());
            }
            blogPost.Status = (Status) dr["Status"];
            blogPost.Category.CategoryId = (int) dr["CategoryID"];
            blogPost.Category.CategoryTitle = dr["CategoryTitle"].ToString();
            blogPost.User = PopulateUserDataFromReader(dr);

            return blogPost;
        }
    }
}
