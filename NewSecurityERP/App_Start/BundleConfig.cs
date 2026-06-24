using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace NewSecurityERP.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.UseCdn = true;   //enable CDN support           

            // CSS bundle
            bundles.Add(new StyleBundle("~/bundles/css").Include(
                     ));  // Add more CSS files as needed

            // JS bundle
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                      ));  // Add more JS files as needed

            // Enable optimizations (minification and bundling)
            BundleTable.EnableOptimizations = true;
        }
    }
}