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
        public List<Category> Categories { get; set; } 
        public List<Hashtag> Hashtags { get; set; } 
        //List of Users

        public NewBlogPostVM()
        {
            BlogPost = new BlogPost();
            Categories = new List<Category>();
            Hashtags = new List<Hashtag>();
        }

    }
}