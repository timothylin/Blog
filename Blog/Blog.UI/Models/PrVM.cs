using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class PRVM
    {
        public List<BlogPost> BlogPosts { get; set; }
        public List<ApplicationUser> Users { get; set; }
        public List<StaticPage> Pages { get; set; }

        public PRVM()
        {
            BlogPosts = new List<BlogPost>();
            Users = new List<ApplicationUser>();
            Pages = new List<StaticPage>();
        }
    }
}