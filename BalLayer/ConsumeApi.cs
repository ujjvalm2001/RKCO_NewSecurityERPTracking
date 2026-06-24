using System;
using System.Collections.Generic;
using System.IO;
using RestSharp;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace BalLayer
{
    /// <summary>
    /// API Consumer for third-party KYC/Aadhaar services
    /// SECURITY: All API tokens are read from configuration (Web.config or environment variables)
    /// Never hardcode credentials in source code
    /// </summary>
    public class ConsumeApi
    {
        private readonly string _aadhaarKycToken;
        private readonly string _surePassTokenV2;
        private readonly string _bankVerificationToken;

        public ConsumeApi()
        {
            // Read tokens from secure configuration sources
            // Priority: Environment Variables > Web.config > Default placeholder
            _aadhaarKycToken = GetSecureConfigValue("AadhaarKycToken", "Bearer CONFIGURE_ME_IN_APPSETTINGS");
            _surePassTokenV2 = GetSecureConfigValue("SurePassTokenV2", "Bearer CONFIGURE_ME_IN_APPSETTINGS");
            _bankVerificationToken = GetSecureConfigValue("BankVerificationToken", "Bearer CONFIGURE_ME_IN_APPSETTINGS");

            // Validate tokens are configured
            if (_aadhaarKycToken.Contains("CONFIGURE_ME"))
            {
                throw new ConfigurationErrorsException("AadhaarKycToken not configured in appSettings. Configure in Web.config or environment variable.");
            }
        }

        /// <summary>
        /// Retrieve configuration value from environment variables first, then Web.config
        /// This allows secure configuration in production without exposing secrets in code
        /// </summary>
        private string GetSecureConfigValue(string key, string defaultValue = "")
        {
            // Try environment variable first (recommended for production)
            var envValue = Environment.GetEnvironmentVariable(key);
            if (!string.IsNullOrEmpty(envValue))
            {
                return envValue;
            }

            // Fall back to Web.config
            var configValue = ConfigurationManager.AppSettings[key];
            if (!string.IsNullOrEmpty(configValue))
            {
                return configValue;
            }

            return defaultValue;
        }

        public string ConsumePostApi(string apiurl)
        {
            string outPutMsg = string.Empty;

            WebRequest objRequest = WebRequest.Create(apiurl);
            objRequest.Method = "POST";
            objRequest.ContentLength = 0;
            HttpWebResponse objRespone = null;
            objRespone = (HttpWebResponse)objRequest.GetResponse();

            using (Stream objstream = objRespone.GetResponseStream())
            {
                StreamReader sr = new StreamReader(objstream);
                outPutMsg = sr.ReadToEnd();
                sr.Close();
            }

            return outPutMsg;
        }

        public string ConsumePostPan(string apiurl)
        {
            string outPutMsg = string.Empty;

            var client = new RestClient("https://sandbox.aadhaarkyc.io/api/v1/pan/pan");
            var request = new RestRequest(Method.Post.ToString());
            request.Timeout = (int)TimeSpan.FromSeconds(10).TotalMilliseconds;
            const SecurityProtocolType tls13 = (SecurityProtocolType)12288;

            ServicePointManager.SecurityProtocol = tls13 | SecurityProtocolType.Tls12;

            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", _aadhaarKycToken);  // Use secure configuration
            var body = @"{" + "\n" + @"	""id_number"": """ + apiurl + "" + "\"" + @"}";
            request.AddParameter("application/json", body, ParameterType.RequestBody);
            RestResponse response = client.Execute(request);
            return response.Content.ToString();
        }

        public string ConsumePostAadhaarGenerateOTP(string AadharNo)
        {
            string outPutMsg = string.Empty;

            var client = new RestClient("https://kyc-api.surepass.io/api/v1/aadhaar-v2/generate-otp");
            var request = new RestRequest();
            request.Method = Method.Post;
            request.Timeout = (int)TimeSpan.FromSeconds(10).TotalMilliseconds;
            const SecurityProtocolType tls13 = (SecurityProtocolType)12288;
            ServicePointManager.SecurityProtocol = tls13 | SecurityProtocolType.Tls12;

            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", _surePassTokenV2);  // Use secure configuration
           
            var body = "{\"id_number\": \"" + AadharNo + "\"}";

            request.AddParameter("application/json", body, ParameterType.RequestBody);
            RestResponse response = client.Execute(request);
            Console.WriteLine(response.Content);
            return response.Content.ToString();
        }

        public string ConsumePostAadhaarVerification(string clientId, string OTP)
        {
            string outPutMsg = string.Empty;

            var client = new RestClient("https://kyc-api.surepass.io/api/v1/aadhaar-v2/submit-otp");
            var request = new RestRequest();
            request.Method = Method.Post;
            request.Timeout = (int)TimeSpan.FromSeconds(10).TotalMilliseconds;
            const SecurityProtocolType tls13 = (SecurityProtocolType)12288;
            ServicePointManager.SecurityProtocol = tls13 | SecurityProtocolType.Tls12;
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", _surePassTokenV2);  // Use secure configuration
            var body = @"{" + "\n" +
           @"	""client_id"": """ + @"" + clientId + @"""," + "\n" +
           @"	""otp"": """ + @"" + OTP + @"""" + "\n" +
           @"}";
            request.AddParameter("application/json", body, ParameterType.RequestBody);
            RestResponse response = client.Execute(request);
            Console.WriteLine(response.Content); 
            return response.Content.ToString() + "#" + Convert.ToString(response.ResponseStatus);

        }

        public string ConsumePostBankVerification(string AccountNo, string Ifsc)
        {

            string outPutMsg = string.Empty;

            var client = new RestClient("https://kyc-api.surepass.io/api/v1/bank-verification/pennyless");
            var request = new RestRequest();
            request.Method = Method.Post;
            request.Timeout = (int)TimeSpan.FromSeconds(10).TotalMilliseconds;
            const SecurityProtocolType tls13 = (SecurityProtocolType)12288;
            ServicePointManager.SecurityProtocol = tls13 | SecurityProtocolType.Tls12;
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Authorization", _bankVerificationToken);  // Use secure configuration
            var body = @"{" + "\n" +
            @"	""id_number"": """ + @"" + AccountNo + @"""," + "\n" +
            @"	""ifsc"": """ + @"" + Ifsc + @"""," + "\n" +
            @"	""ifsc_details"": """ + @"" + true + @"""" + "\n" +
            @"}";
            request.AddParameter("application/json", body, ParameterType.RequestBody);
            RestResponse response = client.Execute(request);
            Console.WriteLine(response.Content); 
            return response.Content.ToString() + "#" + Convert.ToString(response.ResponseStatus);
        }
    }

    public class Response
    {
        public string OutputCode { get; set; }
        public string Data { get; set; }
        public string OutputMessage { get; set; }
    }
}

