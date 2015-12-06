using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class PrVM
    {
        public List<BlogPost> BlogPosts { get; set; }

        public PrVM()
        {
            BlogPosts = new List<BlogPost>();
        }
    }
}