using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class AllPostsVM
    {
        public List<BlogPost> BlogPosts { get; set; }
        public int PostCount { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }

        public AllPostsVM()
        {
            BlogPosts = new List<BlogPost>();
        }

    }
}