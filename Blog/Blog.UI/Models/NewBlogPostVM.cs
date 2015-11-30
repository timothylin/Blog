using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class NewBlogPostVM
    {
        public BlogPost BlogPost { get; set; }
        //List of Categories
        //List of Users

        public NewBlogPostVM()
        {
            BlogPost = new BlogPost();
        }

    }
}