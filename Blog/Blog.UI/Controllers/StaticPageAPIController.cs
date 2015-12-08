using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Blog.BLL;
using Blog.Models;

namespace Blog.UI.Controllers
{
    public class StaticPageAPIController : ApiController
    {
        private BlogOperations _ops;

        public List<StaticPage> Get()
        {
            _ops = new BlogOperations();

            return _ops.GetAllStaticPages().StaticPages.Where(p => p.Status == BlogPostStatus.Approved).ToList();
        }

        public StaticPage Get(int id)
        {
            _ops = new BlogOperations();

            return _ops.GetStaticPageById(id).StaticPage;
        }

    }
}
