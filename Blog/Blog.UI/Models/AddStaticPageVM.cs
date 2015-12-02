using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Blog.Models;

namespace Blog.UI.Models
{
    public class AddStaticPageVM
    {
        public StaticPage StaticPage { get; set; }

        public AddStaticPageVM()
        {
            StaticPage = new StaticPage();
        }
    }
}