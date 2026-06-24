using BalLayer;
using DalLayer;
using NewSecurityERP.Masters;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewSecurityERP.Transaction
{
    public partial class UnitWiseTaskManagment : System.Web.UI.Page
    {
        public int CompId = 0;

        public UnitWiseTaskManagment()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["CompanyID"])))
            {
                CompId = Convert.ToInt32(Session["CompanyID"].ToString());

                try
                {
                    if (!IsPostBack)
                    {
                        BindBranchDropDown();
                        BindTaskDropDown();
                        BindGridView();
                        ViewState["flag"] = 0;
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
                }
            }
            else
            {
                Response.Redirect("/");
            }
        }

        public void BindBranchDropDown()
        {
            try
            {
                DataTable dt = DBClass.GetDataTableByProc("GetAllBranch_Tracking");
                if (dt.Rows.Count > 0)
                {
                    gvBranch.DataSource = dt;
                    gvBranch.DataBind();
                }
                else
                {
                    gvBranch.DataSource = null;
                    gvBranch.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindTaskDropDown()
        {
            try
            {
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindTableData("TASKMASTER", "Taskcode");
                if (dt.Rows.Count > 0)
                {
                    gvTask.DataSource = dt;
                    gvTask.DataBind();
                }
                else
                {
                    gvTask.DataSource = null;
                    gvTask.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindUnitDropDown(string BranchCodes)
        {
            try
            {
                UnitDiv.Visible = true;
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindUnitDropDownByBranchCodes(CompId, BranchCodes);
                if (dt.Rows.Count > 0)
                {
                    gvUnit.DataSource = dt;
                    gvUnit.DataBind();
                }
                else
                {
                    gvUnit.DataSource = null;
                    gvUnit.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        public void BindQuestionsDropDown(string TaskCodes)
        {
            try
            {
                QuestionsDiv.Visible = true;
                MasterCommonClass mc = new MasterCommonClass();
                DataTable dt = mc.BindAllQuestionsByTaskCode(CompId, TaskCodes);
                if (dt.Rows.Count > 0)
                {
                    gvQuestion.DataSource = dt;
                    gvQuestion.DataBind();
                }
                else
                {
                    gvQuestion.DataSource = null;
                    gvQuestion.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)})</script>", false);
            }
        }

        protected void BtnGetUnits_Click(object sender, EventArgs e)
        {
            try
            {                
                StringBuilder selectedBranchCodes = new StringBuilder();

                foreach (GridViewRow row in gvBranch.Rows)
                {
                    CheckBox chkBranch = (CheckBox)row.FindControl("chkBranch");

                    if (chkBranch != null && chkBranch.Checked)
                    {
                        Label lblBranchCode = (Label)row.FindControl("lblBranchCode");
                        if (lblBranchCode != null)
                        {
                            selectedBranchCodes.Append(lblBranchCode.Text);
                            selectedBranchCodes.Append(",");
                        }
                    }
                }

                string BranchCodes = selectedBranchCodes.ToString().TrimEnd(',');

                BindUnitDropDown(BranchCodes);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void BtnGetQuestions_Click(object sender, EventArgs e)
        {
            try
            {                
                StringBuilder selectedTaskCodes = new StringBuilder();

                foreach (GridViewRow row in gvTask.Rows)
                {
                    CheckBox chkTask = (CheckBox)row.FindControl("chkTask");

                    if (chkTask != null && chkTask.Checked)
                    {
                        Label lblTaskCode = (Label)row.FindControl("lblTaskCode");
                        if (lblTaskCode != null)
                        {
                            selectedTaskCodes.Append(lblTaskCode.Text);
                            selectedTaskCodes.Append(",");
                        }
                    }
                }

                string TaskCodes = selectedTaskCodes.ToString().TrimEnd(',');

                BindQuestionsDropDown(TaskCodes);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void ClearFormData()
        {
            // Get the current URL
            string currentUrl = Request.Url.ToString();

            // Redirect to the current page
            Response.Redirect(currentUrl);
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            try
            {
                ClearFormData();
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
                string BranchCodes = BuildSelectedCodes(gvBranch, "chkBranch", "lblBranchCode", "Branch");
                if(string.IsNullOrEmpty(BranchCodes) )
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject("Please Select Any Branch First")})</script>", false);
                    return;
                }

                string UnitCodes = BuildSelectedCodes(gvUnit, "chkUnit", "lblUnitCode", "Unit");
                if (string.IsNullOrEmpty(UnitCodes))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject("Please Select Any Unit First")})</script>", false);
                    return;
                }

                string TaskCodes = BuildSelectedCodes(gvTask, "chkTask", "lblTaskCode", "Task");
                if (string.IsNullOrEmpty(TaskCodes))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject("Please Select Any Task First")})</script>", false);
                    return;
                }

                string QuesCodes = BuildSelectedCodes(gvQuestion, "chkQuestion", "lblQuestionId", "Question");
                if (string.IsNullOrEmpty(QuesCodes))
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", $"<script>warning({JsonConvert.SerializeObject("Please Select Any Question First")})</script>", false);
                    return;
                }



                UnitWiseTaskManagmentMasters uwtm = new UnitWiseTaskManagmentMasters
                {
                    id = Convert.ToInt32(HiddenFieldID.Value),
                    flag = Convert.ToInt32(ViewState["flag"]),
                    BranchCode = BranchCodes,
                    UnitCode = UnitCodes,
                    TaskCode = TaskCodes,
                    QuestionId = QuesCodes,
                    UserID = Convert.ToString(Session["UserID"])
                };

                MasterCommonClass mc = new MasterCommonClass();
                string result = mc.InsertUnitWiseTaskManagmentData(uwtm);
                if (result == "Record Saved Successfully")
                {
                    ClearFormData();
                    BindGridView();
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Success", $"<script>success({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Record Saved Successfully")})</script>", false);
                }

            }
            catch (SqlException SqlEx)
            {
                if (SqlEx.Number == 2627)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject("Data already exists.")})</script>", false);
                    BindGridView();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(SqlEx.Message)})</script>", false);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        private string BuildSelectedCodes(GridView gridView, string checkBoxId, string labelId, string entityName)
        {
            StringBuilder selectedIds = new StringBuilder();

            foreach (GridViewRow row in gridView.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl(checkBoxId);
                Label lbl = (Label)row.FindControl(labelId);

                if (chk != null && chk.Checked && lbl != null)
                {
                    selectedIds.Append(lbl.Text);
                    selectedIds.Append(",");
                }
            }

            return selectedIds.ToString().TrimEnd(',');
        }

        protected void BindGridView()
        {
            try
            {
                DataTable dt = DBClass.GetDataTableByProc("GetAllUnitWiseTaskData");
                gvUnitWiseTask.DataSource = dt;
                gvUnitWiseTask.DataBind();
                Session["UnitWiseTaskData"] = dt;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Error", $"<script>error({JsonConvert.SerializeObject(ex.Message)}</script>", false);
            }
        }

        protected void gvUnitWiseTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditUnitWiseTask")
                {
                    string ID = e.CommandArgument.ToString();
                    DataTable dtFromSession = (DataTable)Session["UnitWiseTaskData"];
                    DataRow[] rows = dtFromSession.Select("TaskManagementID = " + ID);
                    if (rows.Length > 0)
                    {
                        DataRow row = rows[0];
                        HiddenFieldID.Value = rows[0]["TaskManagementID"].ToString();                       
                        string BranchCode = rows[0]["BranchCode"].ToString();                        
                        string UnitCode = rows[0]["UnitCode"].ToString();                        
                        string TaskCode = rows[0]["TaskCode"].ToString();                        
                        string QuesIds = rows[0]["QuestionID"].ToString();

                        BindUnitDropDown(BranchCode);
                        BindQuestionsDropDown(TaskCode);

                        string[] branchCodesArray = BranchCode.Split(',');
                        string[] unitCodesArray = UnitCode.Split(',');
                        string[] taskCodesArray = TaskCode.Split(',');
                        string[] quesIdsArray = QuesIds.Split(',');

                        // Set checkboxes in respective GridViews
                        SetSelectedCodes(gvBranch, "chkBranch", "lblBranchCode", branchCodesArray);
                        SetSelectedCodes(gvUnit, "chkUnit", "lblUnitCode", unitCodesArray);
                        SetSelectedCodes(gvTask, "chkTask", "lblTaskCode", taskCodesArray);
                        SetSelectedCodes(gvQuestion, "chkQuestion", "lblQuestionId", quesIdsArray);

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


        private void SetSelectedCodes(GridView gridView, string checkBoxId, string labelId, string[] selectedIds)
        {
            foreach (GridViewRow row in gridView.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl(checkBoxId);
                Label lbl = (Label)row.FindControl(labelId);

                if (chk != null && lbl != null && selectedIds.Contains(lbl.Text))
                {
                    chk.Checked = true;
                }
            }
        }



    }
}