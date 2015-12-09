using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Models
{
    public class BlogStats
    {
        public int TotalUsers { get; set; }
        public int TotalAdmins { get; set; }
        public int TotalPosts { get; set; }
        public int TotalActivePosts { get; set; }
        public int TotalHashtags { get; set; }
        public int TotalStaticPages { get; set; }
        public List<Hashtag> Hashtags { get; set; }

        public BlogStats()
        {
            Hashtags = new List<Hashtag>();
        }
    }

}
