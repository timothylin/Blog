using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Blog.Models;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Blog.UI.Models
{
    public class AdminVM
    {
        public List<BlogPost> BlogPosts { get; set; }
        public List<ApplicationUser> Users { get; set; }
        public List<IdentityRole> Roles { get; set; }

        public AdminVM()
        {
            BlogPosts = new List<BlogPost>();
            Users = new List<ApplicationUser>();
            Roles = new List<IdentityRole>();
        }
    }
}