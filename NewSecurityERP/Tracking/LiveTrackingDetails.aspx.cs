using BalLayer;
using NewSecurityERP.CandidateRegistration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Tracking
{
    public partial class LiveTrackingDetails : System.Web.UI.Page
    {

        string APIImageUrl = WebConfigurationManager.AppSettings.Get("APIImageURL");
        string EmpImgURL = WebConfigurationManager.AppSettings.Get("EmployeeImgURL");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployeeTaskDetails();
                GetEmployeeDetails();
                GetUnitQuestionAnswer();
            }
        }


        protected void GetEmployeeDetails()
        {
            try
            {
                string EmpCode = Request.QueryString["EmpCode"] as string;
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.GetEmployeeDetailsData(EmpCode);
                if (dt != null && dt.Rows.Count > 0)
                {
                    string empPhotoName = dt.Rows[0]["EmpPhotoName"].ToString();
                    //empPhoto.Src = EmpImgURL + empPhotoName;
                    lblEmpName.Text = dt.Rows[0]["Empname"].ToString();
                    lblPunchInTime.Text = dt.Rows[0]["PunchInTime"].ToString();
                    lblPunchInAddress.Text = dt.Rows[0]["PunchInAddress"].ToString();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }


        protected void GetEmployeeTaskDetails()
        {
            try
            {
                int totalTasks = 0;
                int completedTasks = 0;
                int pendingTasks = 0;

                 DateTime Date = DateTime.Now.Date;
                // DateTime Date = new DateTime(2024, 7, 10);
                string EmpCode = Request.QueryString["EmpCode"] as string;

                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.GetUserTaskDetailsData(EmpCode, Date);

                if (dt != null && dt.Rows.Count > 0)
                {
                    TaskRepeator.DataSource = dt;
                    TaskRepeator.DataBind();

                    // Counting tasks
                    totalTasks = dt.Rows.Count;
                    completedTasks = dt.AsEnumerable().Count(row => row.Field<string>("VisitStatus") == "Completed");
                    pendingTasks = dt.AsEnumerable().Count(row => row.Field<string>("VisitStatus") == "Pending");

                    TotalTask.Text = totalTasks.ToString();
                    CompletedTask.Text = completedTasks.ToString();
                    PendingTask.Text = pendingTasks.ToString();
                }
                else
                {
                    TaskRepeator.DataSource = null;
                    TaskRepeator.DataBind();

                    TotalTask.Text = totalTasks.ToString();
                    CompletedTask.Text = completedTasks.ToString();
                    PendingTask.Text = pendingTasks.ToString();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }


        protected void GetUnitQuestionAnswer()
        {
            DateTime Date = DateTime.Now.Date;
            // DateTime Date = new DateTime(2024, 7, 10);
            string EmpCode = Request.QueryString["empcode"] as string;
            int CompId = Convert.ToInt32(Request.QueryString["compid"]);

            MasterCommonClass mc = new MasterCommonClass();
            DataTable dt = mc.GetVisitedUnitQuestionAnswer(EmpCode, CompId, Date);

            List<UnitData> unitsData = new List<UnitData>();

            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    int unitCode = Convert.ToInt32(row["UnitCode"]);

                    // Check if this unitCode already exists in unitsData
                    UnitData unitData = unitsData.FirstOrDefault(u => u.UnitCode == unitCode);

                    if (unitData == null)
                    {
                        unitData = new UnitData
                        {
                            UnitCode = unitCode,
                            UnitName = row["UnitName"].ToString(),
                            Address = row["Address"].ToString(),
                            Questions = new List<Question>()
                        };
                        unitsData.Add(unitData);
                    }

                    // Create question object
                    Question question = new Question
                    {
                        QuesID = Convert.ToInt32(row["QuesID"]),
                        QuestionText = row["Question"].ToString(),
                        AnswerID = Convert.ToInt32(row["AnswerID"]),
                        AnswerText = row["AnswerText"].ToString(),
                        UploadedImages = new List<Media>(),
                        UploadedMedia = new List<Media>(),
                    };

                    // Add uploaded images if any                   

                    if (!string.IsNullOrEmpty(row["UploadedImage"].ToString()))
                    {
                        var imagesArray = JsonConvert.DeserializeObject<List<Media>>(row["UploadedImage"].ToString());
                        if (imagesArray != null)
                        {
                           // question.UploadedImages.AddRange(imagesArray);
                            question.UploadedImages.AddRange(imagesArray.Select(a => new Media { FileName = APIImageUrl + "image/" + a.FileName, Remarks = a.Remarks }));
                        }
                    }

                    if (!string.IsNullOrEmpty(row["UploadedAudio"].ToString()))
                    {
                        var audioArray = JsonConvert.DeserializeObject<List<Media>>(row["UploadedAudio"].ToString());
                        if (audioArray != null)
                        {
                            question.UploadedMedia.AddRange(audioArray.Select(a => new Media { FileName = a.FileName, FileType = "audio", Remarks = a.Remarks }));
                        }
                    }

                    if (!string.IsNullOrEmpty(row["UploadedVideo"].ToString()))
                    {
                        var videoArray = JsonConvert.DeserializeObject<List<Media>>(row["UploadedVideo"].ToString());
                        if (videoArray != null)
                        {
                            question.UploadedMedia.AddRange(videoArray.Select(v => new Media { FileName = v.FileName, FileType = "video", Remarks = v.Remarks }));
                        }
                    }


                    // Add question to unitData
                    unitData.Questions.Add(question);

                }
            }

            // Bind the repeater control
            rptAccordion.DataSource = unitsData;
            rptAccordion.DataBind();
        }


        protected bool HasUploadedImages(object uploadedImages)
        {
            List<Media> images = uploadedImages as List<Media>;
            return images != null && images.Count > 0;
        }

        protected bool HasFiles(object uploadedMedia)
        {
            List<Media> mediaList = uploadedMedia as List<Media>;
            return mediaList != null && mediaList.Count > 0;
        }


        protected void DownloadFile_Click(object sender, CommandEventArgs e)
        {
            try
            {
                string filePath = "";
                LinkButton btn = (LinkButton)sender;

                string argument = e.CommandArgument.ToString();
                string[] arguments = argument.Split('|');

                string fileName = arguments[0];
                string fileType = arguments[1];

                if(fileType == "audio")
                {
                    filePath = APIImageUrl + "audio/" + fileName;
                }
                else if(fileType == "video")
                {
                    filePath = APIImageUrl + "video/" + fileName;
                }

                if (UrlExists(filePath))
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.TransmitFile(filePath);
                    Response.End();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Something Went Wrong !")})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        private bool UrlExists(string url)
        {
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "HEAD";
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    return response.StatusCode == HttpStatusCode.OK;
                }
            }
            catch
            {
                return false;
            }
        }

        [WebMethod]
        public static object GetUserStartPoint(string EmpCode)
        {
            // return new { Latitude = 28.50586, Longitude = 77.18514 };

            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.GetUserStartLatLng(EmpCode);
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    decimal latitude = Convert.ToDecimal(row["InLatitude"]);
                    decimal longitude = Convert.ToDecimal(row["InLongitude"]);

                    return new { Latitude = latitude, Longitude = longitude };
                }
                else
                {
                    throw new Exception("User's start point not found in the database.");
                }
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }
        }

        //[WebMethod]
        //public static List<object> GetUserLocationHistory()
        //{
        //    // Simulated data retrieval (replace with actual database query)
        //    List<object> locations = new List<object>();
        //    locations.Add(new { Latitude = 28.50585, Longitude = 77.18514, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.50739, Longitude = 77.18511, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.51066, Longitude = 77.18393, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.51367, Longitude = 77.18586, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.52696, Longitude = 77.18980, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.53975, Longitude = 77.19908, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.55250, Longitude = 77.20475, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.56497, Longitude = 77.20735, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.57489, Longitude = 77.17807, IsTripEnd = 1 });
        //    locations.Add(new { Latitude = 28.60455, Longitude = 77.15109, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.61758, Longitude = 77.13639, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.64716, Longitude = 77.12612, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.64815, Longitude = 77.12192, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.64616, Longitude = 77.12081, IsTripEnd = 0 });
        //    locations.Add(new { Latitude = 28.64568, Longitude = 77.11974, IsTripEnd = 0 });
        //    return locations;
        //}

        [WebMethod]
        public static object GetUserLocationHistory(string EmpCode, int CompID)
        {
            try
            {
                 DateTime Date = DateTime.Now;
               // DateTime Date = new DateTime(2024, 7, 31);

                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.GetUserLocationHistoryData(EmpCode, CompID, Date);
                List<object> LocationHistory = new List<object>();

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        decimal latitude = Convert.ToDecimal(row["Latitude"]);
                        decimal longitude = Convert.ToDecimal(row["Longitude"]);
                        int TripEnd = Convert.ToInt32(row["IsTripEnd"]);
                        string taskName = row["TaskName"].ToString();

                        LocationHistory.Add(new
                        {
                            Latitude = latitude,
                            Longitude = longitude,
                            IsTripEnd = TripEnd,
                            TaskName = taskName
                        });
                    }
                    return new { data = LocationHistory };
                }
                else
                {
                    return new { data = new List<object>() };
                }
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }
        }

        [WebMethod]
        public static object GetUserAssignedUnits(string EmpCode, int CompID)
        {
            // Simulated data retrieval(replace with actual database query)
            //List<object> units = new List<object>();
            //units.Add(new { UnitName = "AIIMS Hospital", Latitude = 28.56642, Longitude = 77.20904, Address = "Unit AIIms Address", IsVisit = 1 }); // Example assigned unit data
            //units.Add(new { UnitName = "ESI-Basaidarapur", Latitude = 28.66673, Longitude = 77.13682, Address = "Unit ESI-Basaidarapur Address", IsVisit = 0 }); // Example assigned unit data
            //return units;

            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.GetUserAssignedUnitData(EmpCode, CompID);
                List<object> units = new List<object>();

                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        string unitName = row["UnitName"].ToString();
                        decimal latitude = row["Latitude"] != DBNull.Value ? Convert.ToDecimal(row["Latitude"]) : 0.0m; // Default to 0.0 if DBNull
                        decimal longitude = row["Longitude"] != DBNull.Value ? Convert.ToDecimal(row["Longitude"]) : 0.0m; // Default to 0.0 if DBNull
                        string address = row["Address"].ToString();
                        int isVisited = Convert.ToInt32(row["IsVisited"]);

                        units.Add(new
                        {
                            UnitName = unitName,
                            Latitude = latitude,
                            Longitude = longitude,
                            Address = address,
                            IsVisited = isVisited
                        });
                    }
                    return new { data = units };
                }
                else
                {
                    return new { data = new List<object>() };
                }
            }
            catch (Exception ex)
            {
                return new { error = ex.Message };
            }
        }
    }

    public class UnitData
    {
        public int UnitCode { get; set; }
        public string UnitName { get; set; }
        public string Address { get; set; }
        public List<Question> Questions { get; set; }
    }

    public class Question
    {
        public int QuesID { get; set; }
        public string QuestionText { get; set; }
        public int AnswerID { get; set; }
        public string AnswerText { get; set; }
        public List<Media> UploadedImages { get; set; }
        public List<Media> UploadedMedia { get; set; }
    }

    public class Media
    {
        public string FileName { get; set; }
        public string FileType { get; set; }
        public string Remarks { get; set; }
    }
}