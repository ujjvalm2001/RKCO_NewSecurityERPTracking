using BalLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Masters
{
    public partial class TaskMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        public void BindMaxID()
        {
            MasterCommonClass mc = new MasterCommonClass();
            int MaxID = mc.FatchMaxRecord("TASKMASTER", "Taskcode");
            txtTaskCode.Text = (MaxID + 1).ToString();
        }

        protected void ClearFormData()
        {
            txtTaskName.Text = string.Empty;
            rblSendMail.SelectedValue = rblSendSMS.SelectedValue = "0";
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
                TaskMasters tm = new TaskMasters();
                tm.flag = Convert.ToInt32(ViewState["flag"]);
                tm.TaskCode = Convert.ToInt32(txtTaskCode.Text);
                tm.TaskName = txtTaskName.Text;
                tm.SendMail = Convert.ToInt32(rblSendMail.SelectedValue);
                tm.SendSMS = Convert.ToInt32(rblSendSMS.SelectedValue);
                tm.UserID = Convert.ToString(Session["UserID"]);
                tm.CompID = Convert.ToInt32(Session["CompanyID"]);
                MasterCommonClass mc = new MasterCommonClass();
                string result = mc.InsertTaskDetails(tm);
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
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableData("TASKMASTER", "Taskcode");
                gvTaskMaster.DataSource = dt;
                gvTaskMaster.DataBind();
                Session["TaskMasterData"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Error: " + ex.Message)})</script>", false);
            }
        }

        protected void gvTaskMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditTask")
                {
                    string TaskCode = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["TaskMasterData"];
                    DataRow[] rows = dtFromSession.Select("Taskcode = " + TaskCode);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        txtTaskCode.Text = rows[0]["Taskcode"].ToString();
                        txtTaskName.Text = rows[0]["Taskname"].ToString();                        
                        rblSendMail.SelectedValue = rows[0]["Sendmail"].ToString();
                        rblSendSMS.SelectedValue = rows[0]["Sendsms"].ToString();
                        ViewState["flag"] = 1;
                        SaveBtn.Text = "Update";
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