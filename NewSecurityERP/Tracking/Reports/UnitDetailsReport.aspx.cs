using BalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Tracking.Reports
{
    public partial class UnitDetailsReport : System.Web.UI.Page
    {
        string APIImageUrl = WebConfigurationManager.AppSettings.Get("APIImageURL");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUnitQuestionAnswer();
            }
        }

        protected void GetUnitQuestionAnswer()
        {
            //DateTime StartDate = Convert.ToDateTime(Request.QueryString["startdate"]);

            string dateFormat = "dd-MM-yyyy";
            string startDateString = Request.QueryString["startdate"];
            DateTime startDate = DateTime.ParseExact(startDateString, dateFormat, CultureInfo.InvariantCulture);

            string EmpCode = Request.QueryString["supervisor"];
            string VisitType = Request.QueryString["visittype"];
            int UnitCode = Convert.ToInt32(Request.QueryString["unitcode"]);
            string Visitcat = Request.QueryString["visitcat"] ?? "";
            string CreateDateTime = Request.QueryString["CreateDateTime"] ?? "";

            MasterCommonClass mc = new MasterCommonClass();
            DataTable dt = mc.GetUnitDetailsReportData(EmpCode, UnitCode, VisitType, startDate, Visitcat, CreateDateTime);

            List<UnitData> unitsData = new List<UnitData>();

            if (dt != null && dt.Rows.Count > 0)
            {
                lblEmpName.Text = dt.Rows[0]["Empname"].ToString();
                lblDate.Text = startDate.ToString("dd-MM-yyyy");
                string visitType = dt.Rows[0]["VisitType"]?.ToString();
                lblVisitType.Text = visitType == "Planned" ? "Scheduled" : visitType == "UnPlanned" ? "Patrolling" : visitType;
                lblStatus.Text = dt.Rows[0]["IsVisited"].ToString();

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

                if (fileType == "audio")
                {
                    filePath = APIImageUrl + "audio/" + fileName;
                }
                else if (fileType == "video")
                {
                    filePath = APIImageUrl + "video/" + fileName;
                }


                if (File.Exists(filePath))
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.TransmitFile(filePath);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
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