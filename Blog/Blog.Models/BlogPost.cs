using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Blog.Models
{
    public class BlogPost
    {
        public int BlogPostId { get; set; }
        [Required(ErrorMessage="Title is required")]
        [MaxLength(100, ErrorMessage = "Your title cannot be longer than 100 characters")]
        public string BlogPostTitle { get; set; }
        [AllowHtml]
        [Required(ErrorMessage = "Content Text is required")]
        public string BlogPostText { get; set; }
        [Required(ErrorMessage = "Cover Image URL is required")]
        public string CoverImageUrl { get; set; }
        [Required(ErrorMessage = "Description is required")]
        [MaxLength(200, ErrorMessage= "Your description cannot be longer than 200 characters")]
        public string Description { get; set; }
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
