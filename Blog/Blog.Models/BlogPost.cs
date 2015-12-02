using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Blog.Models
{
    public class BlogPost
    {
        public int BlogPostId { get; set; }
        public string BlogPostTitle { get; set; }
        [AllowHtml]
        public string BlogPostText { get; set; }
        public Status Status { get; set; }
        public DateTime TimeCreated { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public List<Hashtag> Hashtags { get; set; } 
        public ApplicationUser User { get; set; }
        public Category Category { get; set; }

        public BlogPost()
        {
            Hashtags = new List<Hashtag>();
            User = new ApplicationUser();
            Category = new Category();
        }

    }
}
