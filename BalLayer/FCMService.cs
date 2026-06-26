using DalLayer;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BalLayer
{
    public class FcmService
    {
        private static readonly HttpClient client = new HttpClient();

        // ✅ Send Push Notification
        public async Task SendAsync(string deviceToken, int taskId, string empCode, string unitName, string date, string title, string body)
        {
            try
            { 
                if (string.IsNullOrEmpty(deviceToken))
                    return;

                string projectId = ConfigurationManager.AppSettings["FCM_ProjectId"];
                string accessToken = await GoogleOAuthService.GetAccessTokenAsync();

                string url = $"https://fcm.googleapis.com/v1/projects/{projectId}/messages:send";

                var payload = new
                {
                    message = new
                    {
                        token = deviceToken,
                        notification = new
                        {
                            title = title,
                            body = body
                        },
                        data = new
                        {
                            taskId = taskId.ToString(),
                            empCode = empCode ?? "", 
                            unitName = unitName ?? "",
                            date = date ?? "",
                            type = "Assign Task"
                        }
                    }
                };

                var json = JsonConvert.SerializeObject(payload);

                var request = new HttpRequestMessage(HttpMethod.Post, url);
                request.Headers.TryAddWithoutValidation("Authorization", $"Bearer {accessToken}");
                request.Content = new StringContent(json, Encoding.UTF8, "application/json");

                await client.SendAsync(request);
            }
            catch (Exception ex)
            {
                LogError("SendAsync", ex);
            }
        }

        public async Task NotifyToUser(string supervisorId, int compId, string date, string unitName, int taskId, string createdBy)
        {
            try
            {
                SqlParameter[] sp =
                {
                    new SqlParameter("@CompID", compId),
                    new SqlParameter("@SupervisorId", supervisorId)
                };

                DataTable dt = DBClass.GetDataTableByProc("GetUserDeviceToken", sp);

                if (dt == null || dt.Rows.Count == 0)
                    return;

                foreach (DataRow row in dt.Rows)
                {
                    string deviceToken = row["DeviceToken"]?.ToString();
                    string empName = row["Empname"]?.ToString();
                    string empCode = row["EmpCode"]?.ToString();

                    if (string.IsNullOrEmpty(empCode))
                        continue;

                    string message = $"Hello {empName} ({empCode}), a new task has been assigned for {unitName} on {date}.";

                    SaveNotification(taskId, supervisorId, compId, message, createdBy);

                    //  Send push notification
                    await SendAsync(
                        deviceToken,
                        taskId,
                        empCode,
                        unitName,
                        date,
                        "📋 New Task Assigned",
                        message
                    );
                }
            }
            catch (Exception ex)
            {
                LogError("NotifyToUser", ex);
            }
        }

        public void SaveNotification(int taskId, string supervisorId, int compId, string message, string createdBy)
        {
            try
            {
                SqlParameter[] sp =
                {
                    new SqlParameter("@TaskID", taskId),
                    new SqlParameter("@Empcode", supervisorId), 
                    new SqlParameter("@Title", "New Task Assigned"),
                    new SqlParameter("@Message", message),
                    new SqlParameter("@CreatedBy", createdBy),
                    new SqlParameter("@CompId", compId)
                };

                DBClass.ExecuteProcedure("InsertNotificationSP", sp);
            }
            catch (Exception ex)
            {
                LogError("SaveNotification", ex);
            }
        }

        private void LogError(string method, Exception ex)
        {
            try
            {
                string path = System.Web.Hosting.HostingEnvironment.MapPath("~/ErrorLog.txt");
                System.IO.File.AppendAllText(path,
                    $"{DateTime.Now} | {method} | {ex}\n");
            }
            catch
            {
                
            }
        }
    }
}