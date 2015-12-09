using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Blog.Models
{
    public class StaticPage
    {
        public int StaticPageId { get; set; }
        [Required(ErrorMessage = "Title is required")]
        [MaxLength(100, ErrorMessage = "Your title cannot be longer than 100 characters")]
        public string StaticPageTitle { get; set; }
        [AllowHtml]
        [Required(ErrorMessage = "Content Text is required")]
        public string StaticPageText { get; set; }
        public PageStatus Status { get; set; }
        public ApplicationUser User { get; set; }
        public DateTime TimeCreated { get; set; }

        public StaticPage()
        {
            User = new ApplicationUser();
        }
    }
}
