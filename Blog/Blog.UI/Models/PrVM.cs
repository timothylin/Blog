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

        public PRVM()
        {
            BlogPosts = new List<BlogPost>();
        }
    }
}