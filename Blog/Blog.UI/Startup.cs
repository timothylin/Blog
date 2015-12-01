using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Blog.UI.Startup))]
namespace Blog.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
