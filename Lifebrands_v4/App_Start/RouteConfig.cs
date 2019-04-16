using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Lifebrands_v4
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapMvcAttributeRoutes();

            routes.MapRoute(
            name: "Products",
            url: "Product/Product/{id}",
            defaults: new { controller = "Product", action = "GetProducts" }
        );

            routes.MapRoute(
            name: "Promos",
            url: "Promo/Promo/{id}",
            defaults: new { controller = "Promo", action = "GetPromos" }
        );

            routes.MapRoute(
            name: "Notifications",
            url: "Notification/Notification/{id}",
            defaults: new { controller = "Notification", action = "GetNotifications" }
        );

            routes.MapRoute(
            name: "Vendors",
            url: "Vendor/Vendor/{id}",
            defaults: new { controller = "Vendor", action = "GetVendors" }
        );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
