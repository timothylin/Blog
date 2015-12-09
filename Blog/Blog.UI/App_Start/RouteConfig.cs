using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Blog.UI
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Admin",
                url: "Admin/{action}/{id}",
                defaults: new { controller = "Admin", action = "AdminDashboard", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "PR",
                url: "PR/{action}/{id}",
                defaults: new { controller = "PR", action = "PRDashBoard", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AllPosts",
                url: "BlogPost/AllPosts",
                defaults: new { controller = "BlogPost", action = "AllPosts", id = 1 }
            );

            routes.MapRoute(
                name: "AllPosts2",
                url: "AllPosts",
                defaults: new { controller = "BlogPost", action = "AllPosts", id = 1 }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
