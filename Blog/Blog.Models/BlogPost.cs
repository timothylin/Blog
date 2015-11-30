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
        public int BlogId { get; set; }
        public string BlogTitle { get; set; }
        [AllowHtml]
        public string BlogText { get; set; }
        //status enum
        public DateTime TimeCreated { get; set; }
        public DateTime? TimeExpiring { get; set; }
        //hashtag list
        //user associated
        //category

    }
}
