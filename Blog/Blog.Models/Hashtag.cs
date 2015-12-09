using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Models
{
    public class Hashtag
    {
        public int HashtagId { get; set; }
        public string HashtagTitle { get; set; }
        public int HashtagCount { get; set; }
    }
}
