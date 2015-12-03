using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Models;

namespace Blog.UI.Models
{
    public class AddBlogPostVM
    {
        public BlogPost BlogPost { get; set; }
        public List<SelectListItem> CategoriesList { get; set; }
        public List<string> hashtags { get; set; } 

        public AddBlogPostVM()
        {
            BlogPost = new BlogPost();

            hashtags = new List<string>();

            CategoriesList = new List<SelectListItem>();
        }

        public void InitializeCategoriesList(List<Category> catsList)
        {
            foreach (var category in catsList)
            {
                var newItem = new SelectListItem();
                newItem.Text = category.CategoryTitle;
                newItem.Value = category.CategoryId.ToString();

                CategoriesList.Add(newItem);
            }
        }
    }
}