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
        public List<SelectListItem> RolesList { get; set; } 

        public AdminVM()
        {
            BlogPosts = new List<BlogPost>();
            Users = new List<ApplicationUser>();
            RolesList = new List<SelectListItem>();
            Roles = new List<IdentityRole>();
        }

        public void CreateRolesList(List<IdentityRole> listOfRoles)
        {
            foreach (var role in listOfRoles)
            {
                var item = new SelectListItem
                {
                    Value = role.Id,
                    Text = role.Name
                };

                RolesList.Add(item);
            }
        }
    }
}