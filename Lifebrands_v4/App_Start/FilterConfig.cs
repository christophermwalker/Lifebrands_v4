﻿using System.Web;
using System.Web.Mvc;

namespace Lifebrands_v4
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
