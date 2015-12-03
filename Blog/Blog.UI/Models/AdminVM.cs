using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Models;

namespace Blog.UI.Models
{
    public class AdminVM
    {
        public List<BlogPost> BlogPosts { get; set; }

        public AdminVM()
        {
            BlogPosts = new List<BlogPost>();
        }
    }
}