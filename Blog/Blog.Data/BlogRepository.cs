﻿using System;
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
                    blogPost.Hashtags = GetHashtagByBlogPostId(blogPost.BlogPostId);

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

                blogPost.Hashtags = GetHashtagByBlogPostId(blogPost.BlogPostId);
            }

            return blogPost;

        }

        public BlogPost AddNewBlogPost(BlogPost blogPost)
        {
            //var hashtags = GetAllHashtags();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@UserID", blogPost.User.Id);
                p.Add("@BlogPostTitle", blogPost.BlogPostTitle);
                p.Add("@BlogPostText", blogPost.BlogPostText);
                p.Add("@TimeCreated", blogPost.TimeCreated);
                p.Add("@Status", (int)blogPost.Status);
                p.Add("@CategoryID", blogPost.Category.CategoryId);
                p.Add("@Description", blogPost.Description);
                p.Add("@CoverImageUrl", blogPost.CoverImageUrl);
                p.Add("@BlogPostID", DbType.Int32, direction: ParameterDirection.Output);

                cn.Execute("AddNewBlogPost", p, commandType: CommandType.StoredProcedure);

                blogPost.BlogPostId = p.Get<int>("BlogPostID");

                if (blogPost.Hashtags != null)
                {

                    blogPost.Hashtags = AddHashtags(blogPost, cn);

                    //foreach (var hashtag in blogPost.Hashtags)
                    //{
                    //    var checkHashtag = hashtags.FirstOrDefault(h => h.HashtagTitle == hashtag.HashtagTitle);

                    //    if (checkHashtag == null)
                    //    {
                    //        p = new DynamicParameters();
                    //        p.Add("@HashtagTitle", hashtag.HashtagTitle);
                    //        p.Add("@HashtagID", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    //        cn.Execute("AddNewHashtag", p, commandType: CommandType.StoredProcedure);

                    //        hashtag.HashtagId = p.Get<int>("HashtagID");

                    //        p = new DynamicParameters();
                    //        p.Add("@BlogPostID", blogPost.BlogPostId);
                    //        p.Add("@HashtagID", hashtag.HashtagId);

                    //        cn.Execute("AddBlogPostHashtags", p, commandType: CommandType.StoredProcedure);
                    //    }
                    //    else
                    //    {
                    //        p = new DynamicParameters();
                    //        p.Add("@BlogPostID", blogPost.BlogPostId);
                    //        p.Add("@HashtagID", checkHashtag.HashtagId);

                    //        cn.Execute("AddBlogPostHashtags", p, commandType: CommandType.StoredProcedure);

                    //        hashtag.HashtagId = checkHashtag.HashtagId;
                    //    }
                    //}

                }

                blogPost = GetBlogPostById(blogPost.BlogPostId);

                return blogPost;
            }
        }

        public BlogPost EditBlogPost(BlogPost blogPost)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@BlogPostID", blogPost.BlogPostId);
                p.Add("@BlogPostTitle", blogPost.BlogPostTitle);
                p.Add("@BlogPostText", blogPost.BlogPostText);
                p.Add("@Status", (int)blogPost.Status);
                p.Add("@CategoryID", blogPost.Category.CategoryId);
                p.Add("@Description", blogPost.Description);
                p.Add("@CoverImageUrl", blogPost.CoverImageUrl);

                cn.Execute("EditBlogPost", p, commandType: CommandType.StoredProcedure);

                if (blogPost.HashtagsUpdated)
                {
                    p = new DynamicParameters();
                    p.Add("@BlogPostID", blogPost.BlogPostId);

                    cn.Execute("DeleteBlogPostHashtagsByBlogPostID", p, commandType: CommandType.StoredProcedure);

                    AddHashtags(blogPost, cn);
                }
            }

            blogPost = GetBlogPostById(blogPost.BlogPostId);

            return blogPost;
        }

        public StaticPage AddNewStaticPage(StaticPage newPage)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@UserID", newPage.User.Id);
                p.Add("@StaticPageTitle", newPage.StaticPageTitle);
                p.Add("@StaticPageText", newPage.StaticPageText);
                p.Add("@TimeCreated", newPage.TimeCreated);
                p.Add("@Status", (int)newPage.Status);
                p.Add("@StaticPageID", DbType.Int32, direction: ParameterDirection.Output);

                cn.Execute("AddNewStaticPage", p, commandType: CommandType.StoredProcedure);

                newPage.StaticPageId = p.Get<int>("StaticPageID");

            }

            newPage = GetStaticPageById(newPage.StaticPageId);

            return newPage;
        }


        public BlogPost UpdateBlogPostStatus(int blogPostId, PageStatus updatedStatus)
        {
            BlogPost blogPost = new BlogPost();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var cmd = new SqlCommand();
                cmd.CommandText = "UpdateStatus";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BlogPostID", blogPostId);
                cmd.Parameters.AddWithValue("@Status", (int)updatedStatus);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogPost = PopulateBlogPostFromReader(dr);
                    }
                }
            }

            blogPost.Hashtags = GetHashtagByBlogPostId(blogPost.BlogPostId);

            return blogPost;
        }


        public StaticPage UpdateStaticPageStatus(int staticPageId, PageStatus updateStaticPageStatus)
        {
            StaticPage staticPage = new StaticPage();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var cmd = new SqlCommand();
                cmd.CommandText = "UpdateStaticPageStatus";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StaticPageID", staticPageId);
                cmd.Parameters.AddWithValue("@Status", (int)updateStaticPageStatus);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        staticPage = PopulateStaticPageFromReader(dr);
                    }
                }
            }

            return staticPage;
        }

        public List<StaticPage> GetAllStaticPages()
        {
            List<StaticPage> staticPages = new List<StaticPage>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var cmd = new SqlCommand();
                cmd.CommandText = "GetAllStaticPages";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        staticPages.Add(PopulateStaticPageFromReader(dr));
                    }
                }
            }

            return staticPages;
        }

        public StaticPage GetStaticPageById(int staticPageId)
        {
            StaticPage page = new StaticPage();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var cmd = new SqlCommand();
                cmd.CommandText = "GetPageByID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cmd.Parameters.AddWithValue("@staticPageID", staticPageId);

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        page = PopulateStaticPageFromReader(dr);
                    }
                }
            }
            return page;
        }

        public StaticPage EditStaticPage(StaticPage page)
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@StaticPageID", page.StaticPageId);
                p.Add("@StaticPageTitle", page.StaticPageTitle);
                p.Add("@StaticPageText", page.StaticPageText);
                p.Add("@Status", page.Status);

                cn.Execute("EditStaticPage", p, commandType: CommandType.StoredProcedure);
            }

            page = GetStaticPageById(page.StaticPageId);

            return page;
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
            Hashtag hashtag = new Hashtag();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@HashtagID", hashtagId);

                hashtag = cn.Query<Hashtag>("GetHashtagByID", p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }

            return hashtag;
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
            Category category = new Category();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                p.Add("@CategoryID", categoryId);

                category = cn.Query<Category>("GetCategoryByID", p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }

            return category;
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

        public ApplicationUser AddRoleToUser(string userId, string roleId)
        {
            ApplicationUser user = new ApplicationUser();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "AddRoleToUser";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@RoleID", roleId);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        user = PopulateUserFromDataReader(dr);
                    }
                }
            }

            return user;
        }

        public ApplicationUser GetUserById(string userId)
        {
            ApplicationUser user = new ApplicationUser();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetUserByID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        user = PopulateUserFromDataReader(dr);
                    }
                }
            }

            return user;
        }

        public ApplicationUser UpdateRoleByUserId(string userId, string roleId)
        {
            ApplicationUser user = new ApplicationUser();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UpdateRoleByUserID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@RoleID", roleId);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        user = PopulateUserFromDataReader(dr);
                    }
                }
            }

            return user;
        }

        public ApplicationUser UpdateUserAccountStatus(string userId, AccountStatus status)
        {
            ApplicationUser user = new ApplicationUser();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UpdateUserAccountStatus";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@AccountStatus", (int)status);
                cmd.Connection = cn;
                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        user = PopulateUserFromDataReader(dr);
                    }
                }
            }

            return user;
        }


        public List<Hashtag> GetHashtagByBlogPostId(int blogPostId)
        {
            List<Hashtag> hashtags = new List<Hashtag>();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {

                var p = new DynamicParameters();

                p.Add("@BlogPostID", blogPostId);

                hashtags = cn.Query<Hashtag>("GetHashtagByBlogPostID", p, commandType: CommandType.StoredProcedure).ToList();

                //var cmd = new SqlCommand();
                //cmd.CommandText = "GetHashtagByBlogPostID";
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@BlogPostID", blogPostId);
                //cmd.Connection = cn;

                //using (SqlDataReader dr = cmd.ExecuteReader())
                //{
                //    while (dr.Read())
                //    {
                //        hashtags.Add(PopulateHashtagsFromReader(dr));
                //    }
                //}
            }

            return hashtags;
        }

        public BlogStats GetBlogStats()
        {
            BlogStats blogStats = new BlogStats();

            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();

                //Total Users
                cmd.CommandText = "select count(AspNetUsers.Id) from AspNetUsers";
                cmd.Connection = cn;
                cn.Open();

                blogStats.TotalUsers = int.Parse(cmd.ExecuteScalar().ToString());

                //Total Admins
                cmd.CommandText = "select count(AspNetUserRoles.RoleId) from AspNetUserRoles where RoleId = 1";
                blogStats.TotalAdmins = int.Parse(cmd.ExecuteScalar().ToString());

                //Total Posts
                cmd.CommandText = "select count(BlogPosts.BlogPostID) from BlogPosts";
                blogStats.TotalPosts = int.Parse(cmd.ExecuteScalar().ToString());

                //Total Active Posts
                cmd.CommandText = "select count(BlogPosts.BlogPostID) from BlogPosts where [Status] = 1";
                blogStats.TotalActivePosts = int.Parse(cmd.ExecuteScalar().ToString());

                //Total Hashtags
                cmd.CommandText = "select count(BlogPostHashtags.HashTagID) from BlogPostHashtags";
                blogStats.TotalHashtags = int.Parse(cmd.ExecuteScalar().ToString());

                //Total Static Pages
                cmd.CommandText = "select count(StaticPages.StaticPageID) from StaticPages where [Status] = 1";
                blogStats.TotalStaticPages = int.Parse(cmd.ExecuteScalar().ToString());

                //Hashtag Stats
                cmd.CommandText = "select ht.HashtagID, ht.HashtagTitle, count(bp.HashtagID) As NumHts from BlogPostHashtags bp " +
                                  "inner join Hashtags ht on bp.HashtagID = ht.HashtagID group by bp.HashtagID, ht.HashtagID, ht.HashtagTitle Order By NumHts Desc";

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        blogStats.Hashtags.Add(PopulateHashtagsFromReader(dr));
                    }
                }
            }

            return blogStats;
        }


        private List<Hashtag> AddHashtags(BlogPost blogPost, SqlConnection cn)
        {
            foreach (var hashtag in blogPost.Hashtags)
            {
                var checkHashtag = GetAllHashtags().FirstOrDefault(h => h.HashtagTitle == hashtag.HashtagTitle);
                var p = new DynamicParameters();

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

            return blogPost.Hashtags;
        }

        private ApplicationUser PopulateUserFromDataReader(SqlDataReader dr)
        {
            ApplicationUser user = new ApplicationUser();

            user.Id = dr["UserID"].ToString();
            user.Email = dr["Email"].ToString();
            user.FirstName = dr["FirstName"].ToString();
            user.LastName = dr["LastName"].ToString();
            user.UserName = dr["UserName"].ToString();
            user.AccountStatus = (AccountStatus)dr["AccountStatus"];

            user.Roles.Add(PopulateRoleFromDataReader(dr));

            return user;
        }

        private IdentityUserRole PopulateRoleFromDataReader(SqlDataReader dr)
        {
            IdentityUserRole role = new IdentityUserRole();

            if (dr["RoleID"] != DBNull.Value)
            {
                role.RoleId = dr["RoleID"].ToString();
            }
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
            blogPost.Status = (PageStatus)dr["Status"];
            blogPost.Category.CategoryId = (int)dr["CategoryID"];
            blogPost.Category.CategoryTitle = dr["CategoryTitle"].ToString();
            blogPost.Description = dr["Description"].ToString();
            blogPost.CoverImageUrl = dr["CoverImageUrl"].ToString();
            blogPost.User = PopulateUserFromDataReader(dr);

            return blogPost;
        }

        private StaticPage PopulateStaticPageFromReader(SqlDataReader dr)
        {
            StaticPage staticPage = new StaticPage();

            staticPage.StaticPageId = (int)dr["StaticPageID"];
            staticPage.StaticPageTitle = dr["StaticPageTitle"].ToString();
            staticPage.StaticPageText = dr["StaticPageText"].ToString();
            staticPage.TimeCreated = DateTime.Parse(dr["TimeCreated"].ToString());
            staticPage.Status = (PageStatus)dr["Status"];
            staticPage.User = PopulateUserFromDataReader(dr);

            return staticPage;

        }

        private Hashtag PopulateHashtagsFromReader(SqlDataReader dr)
        {
            Hashtag hashtag = new Hashtag();

            hashtag.HashtagId = (int)dr["HashtagID"];
            hashtag.HashtagTitle = dr["HashtagTitle"].ToString();
            hashtag.HashtagCount = int.Parse(dr["NumHts"].ToString());

            return hashtag;
        }

    }
}
