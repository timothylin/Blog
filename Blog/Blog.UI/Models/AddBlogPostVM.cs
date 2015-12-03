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

            CategoriesList = new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Value = "Events",
                    Text = "Events"
                },
                new SelectListItem()
                {
                    Value = "Requests",
                    Text = "Requests"
                },
                new SelectListItem()
                {
                    Value = "News",
                    Text = "News"
                },
                new SelectListItem()
                {
                    Value = "Reviews",
                    Text = "Reviews"
                },
                new SelectListItem()
                {
                    Value = "Recaps",
                    Text = "Recaps"
                },
                new SelectListItem()
                {
                    Value = "Advice",
                    Text = "Advice"
                },
                new SelectListItem()
                {
                    Value = "Articles",
                    Text = "Articles"
                },
                new SelectListItem()
                {
                    Value = "Opinions",
                    Text = "Opinions"
                }
            };
        }
    }
}