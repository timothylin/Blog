using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class HomeVM
    {
        public List<BlogPost> BlogPosts { get; set; }
        public BlogStats BlogStats { get; set; }
        public List<Category> Categories { get; set; } 
        
        public HomeVM()
        {
            BlogPosts = new List<BlogPost>();
            BlogStats = new BlogStats();
            Categories = new List<Category>();
        } 
    }
}