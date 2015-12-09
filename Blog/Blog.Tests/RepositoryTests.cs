using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Blog.Data;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using NUnit.Framework;

namespace Blog.Tests
{
    [TestFixture]
    public class RepositoryTests
    {
        public string TestSetupCs;
        public BlogRepository _repo = new BlogRepository();

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
    
        [TestFixtureTearDown]
        public void Dispose()
        {
            //Nothing
        }

        [Test]
        public void TestGetAllBlogPosts()
        {
            int postCount = _repo.GetAllBlogPosts().Count;

            Assert.AreEqual(14, postCount);
        }

        
    }
}
