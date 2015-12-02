using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Models
{
    public class Response
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public List<ApplicationUser> Users { get; set; }
        public List<Role> Roles { get; set; }
        public Hashtag Hashtag { get; set; }
        public List<Hashtag> Hashtags { get; set; }
        public BlogPost BlogPost { get; set; }
        public List<BlogPost> BlogPosts { get; set; }
        public StaticPage StaticPage { get; set; }
        public List<StaticPage> StaticPages { get; set; }
        public Category Category { get; set; }
        public List<Category> Categories { get; set; }

        public Response()
        {
            Users = new List<ApplicationUser>();
            Roles = new List<Role>();
            Hashtag = new Hashtag();
            Hashtags = new List<Hashtag>();
            BlogPost = new BlogPost();
            BlogPosts = new List<BlogPost>();
            StaticPage = new StaticPage();
            StaticPages = new List<StaticPage>();
            Category = new Category();
            Categories = new List<Category>();
        }
    }
}
