using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Blog.Models
{
    public class StaticPage
    {
        public int StaticPageId { get; set; }
        public string StaticPageTitle { get; set; }
        [AllowHtml]
        public string StaticPageText { get; set; }
        public Status Status { get; set; }
        public User User { get; set; }
        public DateTime TimeCreated { get; set; }
        public Category Category { get; set; }

        public StaticPage()
        {
            User = new User();
            Category = new Category();
        }
    }
}
