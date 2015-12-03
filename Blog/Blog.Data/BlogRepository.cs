using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.ExceptionServices;
using System.Text;
using System.Threading.Tasks;
using Blog.Data.Config;
using Blog.Models;
using Dapper;
using Microsoft.AspNet.Identity.EntityFramework;

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
                cmd.CommandText = "GetAllBlogPosts";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPosts.Add(PopulateBlogPostFromReader(dr));
                    }
                }

                foreach (var blogPost in blogPosts)
                {
                    cmd = new SqlCommand();
                    cmd.CommandText = "GetHashtagByBlogPostID";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@BlogPostID", blogPost.BlogPostId);
                    cmd.Connection = cn;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            blogPost.Hashtags.Add(PopulateHashtagsFromReader(dr));
                        }
                    }
                }
            }

            return blogPosts;
        }

        public BlogPost GetBlogPostById(int blogPostId)
        {

            BlogPost blogPost = new BlogPost();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetBlogPostByID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogPostID", blogPostId);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPost = PopulateBlogPostFromReader(dr);
                    }
                }

                cmd = new SqlCommand();
                cmd.CommandText = "GetHashtagByBlogPostID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogPostID", blogPostId);
                cmd.Connection = cn;

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPost.Hashtags.Add(PopulateHashtagsFromReader(dr));
                    }
                }
            }
            return blogPost;
        }

        public BlogPost AddNewBlogPost(BlogPost blogPost)
        {
            var hashtags = GetAllHashtags();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@UserID", blogPost.User.Id);
                p.Add("@BlogPostTitle", blogPost.BlogPostTitle);
                p.Add("@BlogPostText", blogPost.BlogPostText);
                p.Add("@TimeCreated", blogPost.TimeCreated);
                p.Add("@Status", (int)blogPost.Status);
                p.Add("@CategoryID", blogPost.Category.CategoryId);
                p.Add("@BlogPostID", DbType.Int32, direction: ParameterDirection.Output);

                cn.Execute("AddNewBlogPost", p, commandType: CommandType.StoredProcedure);

                blogPost.BlogPostId = p.Get<int>("BlogPostID");

                foreach (var hashtag in blogPost.Hashtags)
                {
                    var checkHashtag = hashtags.FirstOrDefault(h => h.HashtagTitle == hashtag.HashtagTitle);

                    if (checkHashtag == null)
                    {
                        p = new DynamicParameters();
                        p.Add("@HashtagTitle", hashtag.HashtagTitle);
                        p.Add("@HashtagID", dbType: DbType.Int32, direction: ParameterDirection.Output);

                        cn.Execute("AddNewHashtag", p, commandType: CommandType.StoredProcedure);

                        hashtag.HashtagId = p.Get<int>("HashtagID");

                        p = new DynamicParameters();
                        p.Add("@BlogPostID", blogPost.BlogPostId);
                        p.Add("@HashtagID", hashtag.HashtagId);

                        cn.Execute("AddBlogPostHashtags", p, commandType: CommandType.StoredProcedure);
                    }
                    else
                    {
                        p = new DynamicParameters();
                        p.Add("@BlogPostID", blogPost.BlogPostId);
                        p.Add("@HashtagID", checkHashtag.HashtagId);

                        cn.Execute("AddBlogPostHashtags", p, commandType: CommandType.StoredProcedure);

                        hashtag.HashtagId = checkHashtag.HashtagId;
                    }
                }
                return blogPost;
            }
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
                categories = cn.Query<Category>("select * from Categories").OrderBy(c => c.CategoryTitle).ToList();
            }

            return categories;
        }

        public Category GetCategoryById(int categoryId)
        {
            throw new NotImplementedException();
        }

        public List<IdentityRole> GetAllRoles()
        {
            List<IdentityRole> idRoles = new List<IdentityRole>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                idRoles = cn.Query<IdentityRole>("select * from AspNetRoles").ToList();
            }

            return idRoles;

        }

        public List<ApplicationUser> GetAllUsers()
        {
            List<ApplicationUser> users = new List<ApplicationUser>();

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
                        users.Add(PopulateUserFromDataReader(dr));
                    }
                }
            }

            return users;
        }

        private ApplicationUser PopulateUserFromDataReader(SqlDataReader dr)
        {
            ApplicationUser user = new ApplicationUser();

            user.Id = dr["UserID"].ToString();
            user.Email = dr["Email"].ToString();
            user.FirstName = dr["FirstName"].ToString();
            user.LastName = dr["LastName"].ToString();
            user.UserName = dr["UserName"].ToString();

            user.Roles.Add(PopulateRoleFromDataReader(dr));

            return user;
        }

        private IdentityUserRole PopulateRoleFromDataReader(SqlDataReader dr)
        {
            IdentityUserRole role = new IdentityUserRole();

            role.RoleId = dr["RoleID"].ToString();

            return role;
        }


        private BlogPost PopulateBlogPostFromReader(SqlDataReader dr)
        {
            BlogPost blogPost = new BlogPost();

            blogPost.BlogPostId = (int)dr["BlogPostID"];
            blogPost.BlogPostTitle = dr["BlogPostTitle"].ToString();
            blogPost.BlogPostText = dr["BlogPostText"].ToString();
            blogPost.TimeCreated = DateTime.Parse(dr["TimeCreated"].ToString());
            if (dr["ExpirationDate"] != DBNull.Value)
            {
                blogPost.ExpirationDate = DateTime.Parse(dr["ExpirationDate"].ToString());
            }
            blogPost.Status = (Status)dr["Status"];
            blogPost.Category.CategoryId = (int)dr["CategoryID"];
            blogPost.Category.CategoryTitle = dr["CategoryTitle"].ToString();
            blogPost.User = PopulateUserFromDataReader(dr);

            return blogPost;
        }

        private Hashtag PopulateHashtagsFromReader(SqlDataReader dr)
        {
            Hashtag hashtag = new Hashtag();

            hashtag.HashtagId = (int)dr["HashtagID"];
            hashtag.HashtagTitle = dr["HashtagTitle"].ToString();

            return hashtag;
        }
    }
}
