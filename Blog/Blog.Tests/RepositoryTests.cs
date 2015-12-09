using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Blog.Data;
using Blog.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using NUnit.Framework;

namespace Blog.Tests
{
    [TestFixture]
    public class RepositoryTests
    {
        private string _testSetupCs;
        private BlogRepository _repo;
        private JavaScriptSerializer _jss;


        [TestFixtureSetUp]
        public void Init()
        {
            _testSetupCs = ConfigurationManager.ConnectionStrings["Setup"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(_testSetupCs))
            {
                string scriptLoc = @"sql\dbsetup.sql";

                string script = File.ReadAllText(scriptLoc);

                Server server = new Server(new ServerConnection(cn));

                

                server.ConnectionContext.ExecuteNonQuery(script);
            }
        }

        [TestFixtureTearDown]
        public void Dispose()
        {
            //Nothing
        }

        [SetUp]
        public void Setup()
        {
            _repo = new BlogRepository();
            _jss = new JavaScriptSerializer();
        }

        [Test]
        public void TestGetAllBlogPosts()
        {
            int postCount = _repo.GetAllBlogPosts().Count;

            Assert.AreEqual(15, postCount);

            // 14 if ran individually
        }

        [TestCase(5, "BACK IN THE PARKS")]
        [TestCase(7, "Announcement: I'm now a Doctor Woohoo!")]
        public void GetBlogPostByIdTest(int blogPostId, string title)
        {
            var blogPost = _repo.GetBlogPostById(blogPostId);

            Assert.AreEqual(title, blogPost.BlogPostTitle);
        }

        [Test]
        public void AddNewBlogPostTest()
        {
            BlogPost blogPost = new BlogPost();

            blogPost.User.Id = "aef7943d-d5da-4570-98b5-378a077ecfa6";
            blogPost.BlogPostTitle = "Coding or Love?";
            blogPost.BlogPostText =
                "<p>There is power in understanding the journey of others to help create your own. I have always drawn on my muses for inspiration. During my formative years living abroad in Italy, I&rsquo;d devour the VHS tapes of C#&nbsp;stars of the &rsquo;80s that my grandfather would send across the Atlantic. Later on, when I moved back to America and was the kid in school who dressed differently and had trouble reading and writing in English, Coding&nbsp;was my outlet, my source of power.</p>" +
                "<p> Coding & nbsp;is the vehicle through which I question myself. It & rsquo; s the vehicle in which I learn about myself.</p> " +
                "<p> Now, after 18 years in the CodingBA, I want to show you the journey. The pain, the sacrifice, the disappointments and the glory.I want to show you what it really means to chase greatness.</p>" +
                "<p> &nbsp;</p>";
            blogPost.TimeCreated = DateTime.Parse("2015 - 12 - 07 12:21:27");
            blogPost.Status = PageStatus.Approved;
            blogPost.Category.CategoryId = 4;
            blogPost.Description = "The other day I made a big life decision.";
            blogPost.CoverImageUrl = "http://i.imgur.com/aooqCVq.png";

            var returned = _repo.AddNewBlogPost(blogPost);

            Assert.AreEqual(blogPost.User.Id, returned.User.Id);
            Assert.AreEqual(blogPost.BlogPostTitle, returned.BlogPostTitle);
            Assert.AreEqual(blogPost.BlogPostText, returned.BlogPostText);
            Assert.AreEqual(blogPost.TimeCreated, returned.TimeCreated);
            Assert.AreEqual(blogPost.Status, returned.Status);
            Assert.AreEqual(blogPost.Category.CategoryId, returned.Category.CategoryId);
            Assert.AreEqual(blogPost.Description, returned.Description);
            Assert.AreEqual(blogPost.CoverImageUrl, returned.CoverImageUrl);
        }

        [Test]
        public void EditBlogPostTest()
        {
            BlogPost blogPost = new BlogPost();

            blogPost.BlogPostId = 14;
            blogPost.User.Id = "aef7943d-d5da-4570-98b5-378a077ecfa6";
            blogPost.BlogPostTitle = "Coding or Love~~~";
            blogPost.BlogPostText =
                "<p>There is power in understanding the journey of others to help create your own. I have always drawn on my muses for inspiration. During my formative years living abroad in Italy, I&rsquo;d devour the VHS tapes of C#&nbsp;stars of the &rsquo;80s that my grandfather would send across the Atlantic. Later on, when I moved back to America and was the kid in school who dressed differently and had trouble reading and writing in English, Coding&nbsp;was my outlet, my source of power.</p>" +
                "<p> Coding & nbsp;is the vehicle through which I question myself. It & rsquo; s the vehicle in which I learn about myself.</p> " +
                "<p> Now, after 18 years in the CodingBA, I want to show you the journey. The pain, the sacrifice, the disappointments and the glory.I want to show you what it really means to chase greatness.</p>" +
                "<p> &nbsp;</p>" +
                "<p> Oh Yeah...</p>";
            blogPost.TimeCreated = DateTime.Parse("2015 - 12 - 07 12:21:27");
            blogPost.Status = PageStatus.Pending;
            blogPost.Category.CategoryId = 3;
            blogPost.Description = "The other day I made a big life decision...";
            blogPost.CoverImageUrl = "http://vignette1.wikia.nocookie.net/minecraft/images/4/48/150px-Creeper.png/revision/latest?cb=20140101094930";

            var actual = _repo.EditBlogPost(blogPost);

            Assert.AreEqual(blogPost.User.Id, actual.User.Id);
            Assert.AreEqual(blogPost.BlogPostTitle, actual.BlogPostTitle);
            Assert.AreEqual(blogPost.BlogPostText, actual.BlogPostText);
            Assert.AreEqual(blogPost.TimeCreated, actual.TimeCreated);
            Assert.AreEqual(blogPost.Status, actual.Status);
            Assert.AreEqual(blogPost.Category.CategoryId, actual.Category.CategoryId);
            Assert.AreEqual(blogPost.Description, actual.Description);
            Assert.AreEqual(blogPost.CoverImageUrl, actual.CoverImageUrl);
        }

        [Test]
        public void AddNewStaticPageTest()
        {
            StaticPage staticPage = new StaticPage();

            staticPage.User.Id = "74e60034-4ccf-4421-96cd-847d1aa2908a";
            staticPage.StaticPageTitle = "About 2SB&D";
            staticPage.StaticPageText = "<p>\"Two Sweet Boys and Dean\" is a start-up dating service based in Akron, Ohio.</p>" +
"<p> Dean is a struggling DJ with a hidden passion for Bootstrap.Tim is a sweet boy who dreams of one day moving to the big city...of Seattle.Patrick is also a sweet boy who can't resist the \"back-end\".</p>" +
            "<p> Together, we are here to help them find the \"coding partners\" of their dreams.</p> ";
            staticPage.Status = PageStatus.Approved;
            staticPage.TimeCreated = DateTime.Parse("2015-12-07 21:20:10");

            var actual = _repo.AddNewStaticPage(staticPage);

            Assert.AreEqual(staticPage.User.Id, actual.User.Id);
            Assert.AreEqual(staticPage.StaticPageTitle, actual.StaticPageTitle);
            Assert.AreEqual(staticPage.StaticPageText, actual.StaticPageText);
            Assert.AreEqual(staticPage.Status, actual.Status);
            Assert.AreEqual(staticPage.TimeCreated, actual.TimeCreated);
        }

        [Test]
        public void EditStaticPageTest()
        {
            StaticPage staticPage = new StaticPage();

            staticPage.StaticPageId = 2;
            staticPage.User.Id = "74e60034-4ccf-4421-96cd-847d1aa2908a";
            staticPage.StaticPageTitle = "About 2SB&D!";
            staticPage.StaticPageText = "<p>\"Two Sweet Boys and Dean\" is a start-up dating service based in Akron, Ohio.</p>" +
"<p> Dean is a struggling DJ with a hidden passion for Bootstrap.Tim is a sweet boy who dreams of one day moving to the big city...of Seattle.Patrick is also a sweet boy who can't resist the \"back-end\".</p>" +
            "<p> Together, we are here to help them find the \"coding partners\" of their dreams.</p>" +
            "<p> There you go... </p>";
            staticPage.Status = PageStatus.Approved;
            staticPage.TimeCreated = DateTime.Parse("2015-12-07 21:20:10");

            var actual = _repo.EditStaticPage(staticPage);

            Assert.AreEqual(staticPage.StaticPageId, actual.StaticPageId);
            Assert.AreEqual(staticPage.User.Id, actual.User.Id);
            Assert.AreEqual(staticPage.StaticPageTitle, actual.StaticPageTitle);
            Assert.AreEqual(staticPage.StaticPageText, actual.StaticPageText);
            Assert.AreEqual(staticPage.Status, actual.Status);
            Assert.AreEqual(staticPage.TimeCreated, actual.TimeCreated);
        }

        [TestCase(14, 0)]
        [TestCase(14, 1)]
        [TestCase(3, 3)]
        [TestCase(3, 1)]
        public void UpdateBlogPostStatusTest(int blogPostId, PageStatus status)
        {
            var actual = _repo.UpdateBlogPostStatus(blogPostId, status);

            Assert.AreEqual(status, actual.Status);
        }

        [TestCase(1, 3)]
        [TestCase(2, 0)]
        [TestCase(1, 1)]
        [TestCase(2, 1)]
        public void UpdateStaticPageStatusTest(int staticPageId, PageStatus status)
        {
            var actual = _repo.UpdateStaticPageStatus(staticPageId, status);

            Assert.AreEqual(status, actual.Status);
        }

        [Test]
        public void GetAllStaticPagesTest()
        {
            var count = _repo.GetAllStaticPages().Count();

            Assert.AreEqual(3, count);

            // 2 if run individually
        }

        [TestCase(1, "About JSDate")]
        [TestCase(2, "About 2SB&D!")]
        public void GetStaticPageByIdTest(int staticPageId, string title)
        {
            var page = _repo.GetStaticPageById(staticPageId);

            Assert.AreEqual(title, page.StaticPageTitle);
        }

        [Test]
        public void GetAllHashtagsTest()
        {
            var count = _repo.GetAllHashtags().Count();

            Assert.AreEqual(42, count);
        }

        [TestCase(3, "favorites")]
        [TestCase(5, "k-pop")]
        public void GetHashtagByIdTest(int hashtagId, string title)
        {
            var hashtag = _repo.GetHashtagById(hashtagId);

            Assert.AreEqual(title, hashtag.HashtagTitle);
        }

        [Test]
        public void GetAllCategoriesTest()
        {
            List<Category> categories = new List<Category>
            {
                new Category()
                {
                    CategoryId = 1,
                    CategoryTitle = "Events"
                },
                new Category()
                {
                    CategoryId = 2,
                    CategoryTitle = "News"
                },
                new Category()
                {
                    CategoryId = 3,
                    CategoryTitle = "Opinions"
                },
                new Category()
                {
                    CategoryId = 4,
                    CategoryTitle = "Other"
                },
                new Category()
                {
                    CategoryId = 5,
                    CategoryTitle = "Recap"
                }
            };

            var returned = _repo.GetAllCategories();

            var expected = _jss.Serialize(categories);
            var actual = _jss.Serialize(returned);

            Assert.AreEqual(expected, actual);

        }

        [TestCase(2, "News")]
        [TestCase(4, "Other")]
        public void GetCategoryById(int categoryId, string categoryTitle)
        {
            var actual = _repo.GetCategoryById(categoryId);

            Assert.AreEqual(categoryTitle, actual.CategoryTitle);
        }

        [Test]
        public void GetAllRolesTest()
        {
            List<IdentityRole> roles = new List<IdentityRole>
            {
                new IdentityRole()
                {
                    Id = "1",
                    Name = "Admin"
                },
                new IdentityRole()
                {
                    Id = "0",
                    Name = "Default"
                },
                new IdentityRole()
                {
                    Id = "2",
                    Name = "PR"
                },
                new IdentityRole()
                {
                    Id = "3",
                    Name = "User"
                }
            };

            var returned = _repo.GetAllRoles();

            var expected = _jss.Serialize(roles);
            var actual = _jss.Serialize(returned);

            Assert.AreEqual(expected, actual);
        }

        [Test]
        public void GetAllUsersTest()
        {
            var count = _repo.GetAllUsers().Count();

            Assert.AreEqual(7, count);
        }

        [TestCase("06c53da2-4bfe-4a1f-86ad-cf045b593317", "1")]
        [TestCase("06c53da2-4bfe-4a1f-86ad-cf045b593317", "0")]
        public void UpdateRoleByUserId(string userId, string roleId)
        {
            var returned = _repo.UpdateRoleByUserId(userId, roleId);

            foreach (var role in returned.Roles)
            {
                Assert.AreEqual(roleId, role.RoleId);
            }
        }

        [TestCase("06c53da2-4bfe-4a1f-86ad-cf045b593317", "Test Account")]
        [TestCase("76edd973-bd4a-462e-9d15-88d7904898a9", "Regular User")]
        [TestCase("aef7943d-d5da-4570-98b5-378a077ecfa6", "Public Relations")]
        public void GetUserByIdTest(string userId, string name)
        {
            var returned = _repo.GetUserById(userId);

            Assert.AreEqual(name, returned.FirstName + " " + returned.LastName);
        }

        [TestCase("06c53da2-4bfe-4a1f-86ad-cf045b593317", 2)]
        [TestCase("06c53da2-4bfe-4a1f-86ad-cf045b593317", 1)]
        public void UpdateUserAccountStatusTest(string userId, AccountStatus status)
        {
            var returned = _repo.UpdateUserAccountStatus(userId, status);

            Assert.AreEqual(status, returned.AccountStatus);
        }

        [TestCase(1, 4)]
        [TestCase(6, 4)]
        [TestCase(11, 6)]
        public void GetHashtagByBlogPostId(int blogPostId, int hashtagCount)
        {
            var count = _repo.GetHashtagByBlogPostId(blogPostId).Count();

            Assert.AreEqual(hashtagCount, count);
        }
    }
}
