using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Blog.BLL;
using Blog.Data;
using Blog.Models;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using NUnit.Framework;

namespace Blog.Tests
{
    [TestFixture]
    public class OperationsTests
    {

        public string TestSetupCs;
        private BlogOperations _ops = new BlogOperations();
        private Response _response = new Response();

        [TestFixtureSetUp]
        public void Init()
        {
            TestSetupCs = ConfigurationManager.ConnectionStrings["Setup"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(TestSetupCs))
            {
                string scriptLoc = @"sql\dbsetup.sql";

                string script = File.ReadAllText(scriptLoc);

                Server server = new Server(new ServerConnection(cn));

                server.ConnectionContext.ExecuteNonQuery(script);
            }

        }

        [Test]
        public void TestGetAllPosts()
        {
            int postCount = _ops.GetAllBlogPosts().BlogPosts.Count;
            Assert.AreEqual(14, postCount);
        }

        [Test]
        public void TestGetBlogPostById()
        {
            _response = _ops.GetBlogPostById(1);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetAllStaticPages()
        {
            //was two, now three
            int pageCount = _ops.GetAllStaticPages().StaticPages.Count;
            Assert.AreEqual(3, pageCount);

        }

        [Test]
        public void TestGetStaticPageById()
        {
            _response = _ops.GetStaticPageById(1);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetAllHashtags()
        {
            _response = _ops.GetAllHashtags();

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetHashtagById()
        {
            _response = _ops.GetHashtagById(1);
            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetAllRoles()
        {
            _response = _ops.GetAllRoles();

            Assert.AreEqual(true, _response.Success);

        }

        [Test]
        public void TestGetAllCategories()
        {
            _response = _ops.GetAllCategories();
            Assert.AreEqual(true, _response.Success);

        }

        [Test]
        public void TestGetCategoryById()
        {
            _response = _ops.GetCategoryById(1);
            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetAllUsers()
        {
            _response = _ops.GetAllUsers();
            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetUserById()
        {
            _response = _ops.GetUserById("2ee5771a-f120-453f-8995-de7652ddd30d");
            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestAddNewBlogPost()
        {

            var blogpost = new BlogPost();

            blogpost.BlogPostTitle = "Tim's Top 3 Cities";
            blogpost.BlogPostId = 1;
            blogpost.Category.CategoryId = 3;
            blogpost.BlogPostText = "<p>1. &nbsp;Kaohsiung, Taiwan</p>" +
                                    "<p><img src = \"http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg\" alt = \"Kaohsiung\" width = \"516\" height = \"417\" /></p>" +
                                    "<p> 2. & nbsp; Taichung, Taiwan </p><p><img src = \"https://travel.yam.com/DATA/ARTICLE/20140715143433380.jpg\" alt = \"Taichung\" width = \"517\" height = \"343\"/></p>" +
                                    "<p> 3. & nbsp; Tokyo, Japan </p> <p><img src = \"https://ict.swisscom.ch/wp-content/uploads/2015/09/tokyo.jpg\" alt = \"Tokyo\" width = \"524\" height = \"262\"/></p>";
            blogpost.TimeCreated = DateTime.Parse("2015 - 12 - 07 12:01:39.170");
            blogpost.Description = "Gotta love traveling!";
            blogpost.CoverImageUrl = "http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg";

            Assert.AreEqual(true, _ops.AddNewBlogPost(blogpost).Success);
        }

        [Test]
        public void TestUpdateStaticPageStatus()
        {
            _response = _ops.UpdateStaticPageStatus(1, PageStatus.Approved);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestUpdateBlogPostStatus()
        {
            _response = _ops.UpdateBlogPostStatus(1, PageStatus.Approved);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestAddNewStaticPage()
        {
            var page = new StaticPage();

            page.StaticPageId = 1;
            page.StaticPageTitle = "About JSDate";
            page.StaticPageText = "<p>From the creators of JDate, the premier online dating service for Jewish-singles, comes a new venture aimed at connecting hearts among individuals who share this one similar passion: coding.</p>" +
            "< p > We are JSDate and we aim to \"plug\" you in with the coding & ldquo; partner & rdquo; of your dreams.</ p >" +
            "< p > Get ready to take your &ldquo; paired - programming & rdquo; to the next level...</ p > ";
            page.Status = PageStatus.Approved;
            page.User.Id = "74e60034-4ccf-4421-96cd-847d1aa2908a";
            page.TimeCreated = DateTime.Parse("2015-12-07 12:01:39.170");



            Assert.AreEqual(true, _ops.AddNewStaticPage(page).Success);
        }

        [Test]
        public void TestUpdateUserAccountStatus()
        {
            _response =_ops.UpdateUserAccountStatus("74e60034-4ccf-4421-96cd-847d1aa2908a", AccountStatus.Active);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestUpdateRoleByUserId()
        {
            _response = _ops.UpdateRoleByUserId("74e60034-4ccf-4421-96cd-847d1aa2908a", "1");

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestGetHashtagsByBlogPostId()
        {
            _response = _ops.GetHashtagsByBlogPostId(1);

            Assert.AreEqual(true, _response.Success);
        }

        [Test]
        public void TestEditBlogPost()
        {

            var blogpost = new BlogPost();

            blogpost.BlogPostTitle = "Tim is a wonderful person";
            blogpost.BlogPostId = 1;
            blogpost.Category.CategoryId = 2;
            blogpost.BlogPostText = "<p>1. &nbsp;Kaohsiung, Taiwan</p>" +
                                    "<p><img src = \"http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg\" alt = \"Kaohsiung\" width = \"516\" height = \"417\" /></p>" +
                                    "<p> 2. & nbsp; Taichung, Taiwan </p><p><img src = \"https://travel.yam.com/DATA/ARTICLE/20140715143433380.jpg\" alt = \"Taichung\" width = \"517\" height = \"343\"/></p>" +
                                    "<p> 3. & nbsp; Tokyo, Japan </p> <p><img src = \"https://ict.swisscom.ch/wp-content/uploads/2015/09/tokyo.jpg\" alt = \"Tokyo\" width = \"524\" height = \"262\"/></p>";
            blogpost.TimeCreated = DateTime.Parse("2015 - 12 - 07 12:01:39.170");
            blogpost.Description = "Gotta love traveling!";
            blogpost.CoverImageUrl = "http://p1-news.yamedia.tw/MTA3Mjc4NG5ld3M=/d7551d6961dea5a6.jpg";


            Assert.AreEqual(true, _ops.EditBlogPost(blogpost).Success);
        }


        [Test]
        public void TestEditStaticPage()
        {
            var page = new StaticPage();

            page.StaticPageId = 1;
            page.StaticPageTitle = "About JSDate";
            page.StaticPageText = "<p>From the creators of JDate, the premier online dating service for Jewish-singles, comes a new venture aimed at connecting hearts among individuals who share this one similar passion: coding.</p>" +
            "< p > We are JSDate and we aim to \"plug\" you in with the coding & ldquo; partner & rdquo; of your dreams.</ p >" +
            "< p > Get ready to take your &ldquo; paired - programming & rdquo; to the next level...</ p > ";
            page.Status = PageStatus.Approved;
            page.User.Id = "74e60034-4ccf-4421-96cd-847d1aa2908a";
            page.TimeCreated = DateTime.Parse("2015-12-07 12:01:39.170");

            Assert.AreEqual(true, _ops.EditStaticPage(page).Success);
        }

        [Test]
        public void TestAddHashtags()
        {
            int hashtagCount = _ops.GetHashtagsByBlogPostId(1).Hashtags.Count;
            Assert.AreEqual(4, hashtagCount);
        }
    }
}
