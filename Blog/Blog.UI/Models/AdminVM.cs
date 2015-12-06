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
        public List<StaticPage> Pages { get; set; }
        public List<IdentityRole> Roles { get; set; }
        public List<SelectListItem> RolesList { get; set; } 

        public AdminVM()
        {
            BlogPosts = new List<BlogPost>();
            Users = new List<ApplicationUser>();
            Pages = new List<StaticPage>();
            RolesList = new List<SelectListItem>();
            Roles = new List<IdentityRole>();
        }

        public void CreateRolesList(List<IdentityRole> listOfRoles)
        {
            foreach (var role in listOfRoles)
            {
                var item = new SelectListItem();
                item.Value = role.Id;
                item.Text = role.Name;

                RolesList.Add(item);
            }

            
        }
    }
}