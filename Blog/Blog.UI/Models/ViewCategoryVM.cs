using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class ViewCategoryVM
    {
        public List<BlogPost> BlogPosts { get; set; }
        public List<Category> Categories { get; set; }
        public Category CurrentCategory { get; set; }

        public ViewCategoryVM()
        {
            BlogPosts = new List<BlogPost>();
            Categories = new List<Category>();
            CurrentCategory = new Category();
        }
    }
}