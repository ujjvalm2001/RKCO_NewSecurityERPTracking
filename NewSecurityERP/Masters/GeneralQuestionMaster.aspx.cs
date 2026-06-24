using BalLayer;
using DalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class GeneralQuestionMaster : System.Web.UI.Page
    {
        public int CompId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
            {
                CompId = Convert.ToInt32(Session["CompanyID"].ToString());
                try
                {
                    if (!IsPostBack)
                    {
                        BindGridView();
                        BindMaxID();
                        ViewState["flag"] = 0;
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
                }
            }
            else
            {
                Response.Redirect("/");
            }
        }

   

        public void BindMaxID()
        {
            MasterCommonClass mc = new MasterCommonClass();
            int MaxID = mc.FatchMaxRecord("GeneralQuestionMaster", "GQuesID");
            txtQuesID.Text = (MaxID + 1).ToString();
        }

        protected void ClearFormData()
        {
            txtQuestion.Text = string.Empty;
            ddlQuesType.SelectedValue = rblImage.SelectedValue = rblAudio.SelectedValue = rblVideo.SelectedValue =ddlQSCategory.SelectedValue= "0";
            SaveBtn.Text = "Save";
            ViewState["flag"] = 0;
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFormData();
                BindMaxID();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder optionsString = new StringBuilder();

                for (int i = 0; i < Request.Form.Count; i++)
                {
                    string key = Request.Form.GetKey(i);
                    if (key != null && key.Contains("txtOption"))
                    {
                        string value = Request.Form[key];
                        if (!string.IsNullOrEmpty(value))
                        {
                            optionsString.Append(value).Append(",");
                        }
                    }
                }
                if (optionsString.Length > 0)
                {
                    optionsString.Remove(optionsString.Length - 1, 1);
                }

                string options = optionsString.ToString();

                GeneralQuestionMasters gqm = new GeneralQuestionMasters();
                gqm.flag = Convert.ToInt32(ViewState["flag"]);
                gqm.QuesId = Convert.ToInt32(txtQuesID.Text);
                gqm.Question = txtQuestion.Text;
                gqm.QuestionType = ddlQuesType.SelectedValue.ToString();
                gqm.QuestionOptions = options;
                gqm.IsImage = Convert.ToInt32(rblImage.SelectedValue);
                gqm.IsAudio = Convert.ToInt32(rblAudio.SelectedValue);
                gqm.IsVideo = Convert.ToInt32(rblVideo.SelectedValue);
                gqm.UserID = Convert.ToString(Session["UserID"]);
                gqm.QSCategory = ddlQSCategory.SelectedValue.ToString();
                MasterCommonClass mc = new MasterCommonClass();
                string result = mc.InsertGeneralQuestionDetails(gqm);
                if (result == "Record Saved Successfully")
                {
                    ClearFormData();
                    BindMaxID();
                    BindGridView();
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                }
            }
            catch (SqlException SqlEx)
            {
                if (SqlEx.Number == 2627)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Data already exists.")})</script>", false);
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void BindGridView()
        {
            try
            {
                DataTable dt = DBClass.GetDataTableByProc("GetAllGeneralQuestions");
                gvSubTaskMaster.DataSource = dt;
                gvSubTaskMaster.DataBind();
                Session["GeneralQuesDetails"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }

        protected void gvSubTaskMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditQuestion")
                {
                    string QuestionId = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["GeneralQuesDetails"];
                    DataRow[] rows = dtFromSession.Select("GQuesID = " + QuestionId);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        txtQuesID.Text = rows[0]["GQuesID"].ToString();
                        txtQuestion.Text = rows[0]["Question"].ToString();
                        string QuesOptions = rows[0]["QuestionOptions"].ToString();
                        string QuestionType = rows[0]["QuestionType"].ToString();

                        ScriptManager.RegisterStartupScript(this, GetType(), "ShowHideOptionInput", $"$(document).ready(function() {{ ShowHideOptionInput('{QuestionType}'); }});", true);

                        ddlQuesType.SelectedValue = QuestionType;
                        rblImage.SelectedValue = rows[0]["IsImage"].ToString();
                        rblAudio.SelectedValue = rows[0]["IsAudio"].ToString();
                        rblVideo.SelectedValue = rows[0]["IsVideo"].ToString();
                        ddlQSCategory.SelectedValue = rows[0]["QuestionFor"].ToString();
                        ViewState["flag"] = 1;
                        SaveBtn.Text = "Update";


                        string[] optionsArray = QuesOptions.Split(',');      // Split the options retrieved from the database

                        // Populate the first two options to the default textboxes (option1 and option2)
                        if (optionsArray.Length >= 2)
                        {
                            txtOption1.Text = optionsArray[0];
                            txtOption2.Text = optionsArray[1];
                        }
                        if (optionsArray.Length > 2)
                        {
                            string script = "$(document).ready(function () { ";
                            for (int i = 2; i < optionsArray.Length; i++)
                            {
                                script += "AppendDiv(\"<div class='col-md-3 option' id='option" + (i + 1) + "'>" +
                                    "<div class='mb-3'>" +
                                    "<label class='form-label'> Option " + (i + 1) + " </label> <span class='text-danger float-end cursor-pointer' onclick='removeOption(this)'>Remove</span>" +
                                    "<input type='text' id='txtOption_" + (i + 1) + "' name='txtOption_" + (i + 1) + "' class='form-control' placeholder='Enter option' value='" + optionsArray[i] + "' >" +
                                    "</div>" +
                                    "</div>\"); ";

                                script += "});";
                                ScriptManager.RegisterStartupScript(this, GetType(), "generateInput", script, true);
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }
    }
}