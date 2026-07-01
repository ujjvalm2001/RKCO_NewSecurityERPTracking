using Google.Apis.Auth.OAuth2;
using System;
using System.Configuration;
using System.IO;
using System.Threading.Tasks;
using System.Web.Hosting;

namespace BalLayer
{
    public class GoogleOAuthService
    {
        public static async Task<string> GetAccessTokenAsync()
        {
            string relativePath = ConfigurationManager.AppSettings["FCM_ServiceAccountPath"];

            if (string.IsNullOrEmpty(relativePath))
                throw new Exception("FCM_ServiceAccountPath not found in config");

            string jsonPath = HostingEnvironment.MapPath(relativePath);
            if (string.IsNullOrEmpty(jsonPath) || !File.Exists(jsonPath))
                throw new FileNotFoundException("Firebase service account json not found", jsonPath);

            GoogleCredential credential = GoogleCredential
                .FromFile(jsonPath)
                .CreateScoped("https://www.googleapis.com/auth/firebase.messaging");

            return await credential
                .UnderlyingCredential
                .GetAccessTokenForRequestAsync();
        }
    }
}