using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class AddBlogPostVM
    {
        public BlogPost BlogPost { get; set; }

        public AddBlogPostVM()
        {
            BlogPost = new BlogPost();
        }
    }
}