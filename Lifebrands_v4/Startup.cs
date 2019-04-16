using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Lifebrands_v4.Startup))]
namespace Lifebrands_v4
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
